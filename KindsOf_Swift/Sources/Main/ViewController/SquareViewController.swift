//
//  SquareViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import TestKinds
import SnapKit
import Foundation
import KindOfUI

class SquareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        loadData()
    }

    lazy var tableView: UITableView = {
        let lazy = UITableView(frame: .zero, style: .plain)
        lazy.dataSource = self
        lazy.delegate = self
        lazy.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        lazy.register(HomeTestViewCell.self, forCellReuseIdentifier: "HomeTestViewCell")

        lazy.separatorInset = .zero
        lazy.estimatedRowHeight = 64
        lazy.estimatedSectionHeaderHeight = 34
        lazy.estimatedSectionFooterHeight = 0.1
        lazy.sectionHeaderTopPadding = .zero
        
        return lazy
    }()
    
    lazy var dataArray: [ItemModel] = []
    
    func setup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func loadData() {
        dataArray.removeAll()
        let name = NSLocalizedString("welcome_message", comment: "").localized("John")
        
        print("\(name.md5WithCommonCrypto())")
        print("\(name.md5WithCryptoKit())")
        
        print(name.toFormat("%@111"))
        
        name.attributed([.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.red])
        
        let s = NSMutableAttributedString(string: "self")

        "".mutableAttributed().then {
            $0.append("".attributed([.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.red]))
            $0.append("".attributed([.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.red]))
            $0.append("".attributed([.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.red]))
        }
        
        dataArray.append(.init(name: "UIKit 中的视图自动刷新", path: "testUIKit", tag: 1))
        dataArray.append(.init(name: name, path: "testUIKit", tag: 1))
        tableView.reloadData()
    }
}

extension SquareViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([])
        
        NSMutableAttributedString(string: "")
    }
}

extension SquareViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = model.name
        
        return cell
    }
}

extension SquareViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = dataArray[indexPath.row]
        
        let actionBlocks: [String: (() -> Void)] = [
            "testUIKit": { [weak self] in
                let vc = UIViewController.getTestUIKitVc()
                self?.navigationController?.pushViewController(vc, animated: true)
            },
        ]
        
        actionBlocks[model.path]?()
    }
}
