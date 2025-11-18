//
//  HomeViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
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
    
    lazy var dataArray: [String] = [
        "HomeTestViewCell"
    ]
    
    
    func setup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let emptyView = UIView()
        let label = UILabel()
        label.text = "暂无数据"
        label.textAlignment = .center
        emptyView.addSubview(label)
//        emptyView.backgroundColor = .orange
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        tableView.backgroundView = emptyView
    }
    
    func loadData() {
        Task {
            do {
                let resp = try await TestApi.test()
                // 直接更新 UI（需 MainActor）
                await MainActor.run {
                    self.title = resp
                }
            } catch {
                print("失败：\(error.localizedDescription)")
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableId = dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)
        if let cell2 = cell as? HomeTestViewCell {
            
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
