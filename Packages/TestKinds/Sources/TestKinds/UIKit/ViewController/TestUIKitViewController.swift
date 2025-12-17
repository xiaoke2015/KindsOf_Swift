//
//  TestUIKitViewController.swift
//  TestKinds
//
//  Created by i-sens on 2025/12/1.
//

import UIKit
import SnapKit

@available(iOS 17.0, *)
@Observable
class TestUIKitState {
    init(name: String) {
        self.name = name
    }
    var name: String
}

@available(iOS 17.0, *)
class TestUIKitViewController: UIViewController {
    
    lazy var viewModel = TestUIKitState(name: "hello")

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    lazy var userNameLabel: UILabel = {
        let lazy = UILabel(frame: .zero)
        return lazy
    }()
    
    lazy var userImageView: UIImageView = {
        let lazy = UIImageView(frame: .zero)
        return lazy
    }()
    
    lazy var testButton: UIButton = {
        let lazy = UIButton(frame: .zero)
        lazy.setTitle("change", for: .normal)
        lazy.setTitleColor(.black, for: .normal)
        lazy.addTarget(self, action: #selector(testButtonAction), for: .touchUpInside)
        return lazy
    }()

    func setup() {
        view.backgroundColor = .white
        
        view.addSubview(userNameLabel)
        view.addSubview(userImageView)
        view.addSubview(testButton)
        
        userNameLabel.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(64)
        }
        
        userImageView.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(12)
            $0.size.equalTo(CGSize(width: 64, height: 64))
        }

        testButton.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(userImageView.snp.bottom).offset(12)
            $0.height.equalTo(48)
        }
    }
    
    @objc func testButtonAction() {
        viewModel.name = "hello world"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        userNameLabel.text = viewModel.name
    }
}
