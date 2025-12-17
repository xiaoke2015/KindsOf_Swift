//
//  HomeViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import SnapKit
import KindOfUI

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
//        loadData()
        loadData2()
        
        socketManager.connect()
        
        var req = LoginRequest()
        print("LoginRequest = \(req.toDict())")
        print("LoginRequest2 = \(req.toDict2())")
        req.mobile = "18912601633"
        print("LoginRequest = \(req.toDict())")
        print("LoginRequest2 = \(req.toDict2())")
        req.code = "306660"
        print("LoginRequest = \(req.toDict())")
        print("LoginRequest2 = \(req.toDict2())")
    }
    
    lazy var socketManager = WebSocketManager()
    
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
    
    func loadData2() {
        let req = TestApiRequest(url: "", method: "", headers: [:])
        
//        TestApi.request(req) { result in
//            switch result {
//            case .success(let resp):
//                print("\(resp)")
//            case .failure(let error):
//                print("\(error)")
//            }
//        }
//        
//        TestApi.shared.request(req, interceptor: nil) { result in
//            switch result {
//            case .success(let resp):
//                print("\(resp)")
//            case .failure(let error):
//                print("\(error)")
//            }
//        }
//        
        TestApi.shared.getList("") { result in
            switch result {
            case .success(let resp):
                print("\(resp)")
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    var userId: Int?
    
    var userModel: UserModel?
    
    func getUserInfo() {
        let params: [String: Any] = [
            "UserId": userId]
            .compactMapValues { $0 }
        
        TestAsyncTask.run {
            try await TestServer.shared.getUserInfo(params, interceptor: GlobalHeaderInterceptor())
        } onSuccess: { [weak self] userInfo in
            print("\(userInfo)")
            self?.userModel = userInfo
        } onError: { error in
            print("\(error)")
        }
    }
    
    func getUserInfo2() {
        TestAsyncTask.run {
            try await TestServer.shared.getGroupUserInfo()
        } onSuccess: { userInfo in
            print("\(userInfo.0),\(userInfo.1)")
        } onError: { error in
            print("\(error)")
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
            cell2.cancelButtonBlock = { [weak self] in
                let date = Date().timeIntervalSince1970
//                self?.socketManager.sendMessage("\(date)")
                self?.view.makeToast("支付成功，请到下个页面完成相关操作")
            }
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
