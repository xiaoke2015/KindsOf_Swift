//
//  MessageViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import SnapKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
//        NotificationCenter.MainActorMessage
    }
    
    lazy var tableView: UITableView = {
        let lazy = UITableView(frame: .zero, style: .plain)
        lazy.dataSource = self
        lazy.delegate = self
        lazy.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        lazy.separatorInset = .zero
        lazy.estimatedRowHeight = 64
//        lazy.estimatedSectionHeaderHeight = 34
//        lazy.estimatedSectionFooterHeight = 0.1
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

extension MessageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "系统消息"
        return cell
    }
}

extension MessageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 1. 创建“删除”操作
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { [weak self] (action, view, completion) in
//            self?.dataArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)  // 通知完成
        }
        // 可选：设置图标（iOS 13+ 支持）
        deleteAction.image = UIImage(systemName: "trash")
        
        // 2. 创建“标记”操作
        let markAction = UIContextualAction(style: .normal, title: "标记") { (action, view, completion) in
            print("标记行：\(indexPath.row)")
            completion(true)
        }
        markAction.backgroundColor = .systemBlue  // 背景色
        markAction.image = UIImage(systemName: "checkmark.circle")  // 图标
        
        // 配置滑动操作（可设置是否允许全滑删除）
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, markAction])
        configuration.performsFirstActionWithFullSwipe = true  // 允许全滑触发第一个操作（这里是删除）
        return configuration
    }
    
//    // 仍需支持编辑模式
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
}
