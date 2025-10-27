//
//  ProfileViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    lazy var tableView: UITableView = {
        let lazy = UITableView(frame: .zero, style: .grouped)
        lazy.dataSource = self
        lazy.delegate = self
        lazy.register(ProfileViewCell.self, forCellReuseIdentifier: "ProfileViewCell")
        
        lazy.separatorInset = .zero
        lazy.estimatedRowHeight = 64
        lazy.estimatedSectionHeaderHeight = 34
        lazy.estimatedSectionFooterHeight = 0.1
        lazy.sectionHeaderTopPadding = .zero
        
        return lazy
    }()
    
    
    func setup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileViewCell", for: indexPath)
        cell.textLabel?.text = "系统消息"
        
        setCornerRadiusForSectionCell(cell: cell, indexPath: indexPath, tableView: tableView, cornerRadius: 16)
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}

extension ProfileViewController {
    /// - Parameters:

    ///  - cell: cell

    ///  - indexPath: indexPath

    ///  - tableView: tableView

    private func setCornerRadiusForSectionCell(cell: UITableViewCell, indexPath: IndexPath, tableView: UITableView, cornerRadius: CGFloat) {

        let sectionCount = tableView.numberOfRows(inSection: indexPath.section)

        //当前分区有多行数据时

        if sectionCount > 1 {

            switch indexPath.row {

                /** 如果是第一行,左上、右上角为圆角**/

            case 0:

                cell.createCorner(CGSize(width: cornerRadius, height: cornerRadius), UIRectCorner(rawValue: (UIRectCorner.topLeft.rawValue)|(UIRectCorner.topRight.rawValue)))
                /** 如果是最后行,左下、右下角为圆角**/

            case sectionCount - 1:
                
                cell.createCorner(CGSize(width: cornerRadius,height: cornerRadius),UIRectCorner(rawValue: (UIRectCorner.bottomLeft.rawValue)|(UIRectCorner.bottomRight.rawValue)))

            default:

                cell.createCorner(.zero, UIRectCorner(rawValue: (UIRectCorner.bottomLeft.rawValue)|(UIRectCorner.bottomRight.rawValue)|(UIRectCorner.topLeft.rawValue)|(UIRectCorner.topRight.rawValue)))

            }

        }

        //当前分区只有一行行数据时

        else {

            cell.createCorner(CGSize(width: cornerRadius, height: cornerRadius), UIRectCorner(rawValue: (UIRectCorner.bottomLeft.rawValue)|(UIRectCorner.bottomRight.rawValue)|(UIRectCorner.topLeft.rawValue)|(UIRectCorner.topRight.rawValue)))

        }

    }
}
