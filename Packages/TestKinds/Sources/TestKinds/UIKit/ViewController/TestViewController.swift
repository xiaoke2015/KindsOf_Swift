//
//  TestViewController.swift
//  TestKinds
//
//  Created by i-sens on 2025/11/18.
//

import UIKit
import Foundation

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        testLabel.then {
//            $0.textColor = .red
//            $0.font = UIFont.systemFont(ofSize: 12)
//        }
        
//        testLabel.
        
        NotificationCenter.default.post(name: .init(""), object: nil)
        
        UILabel.appearance()
    }
    
    lazy var testLabel = UILabel()
}
