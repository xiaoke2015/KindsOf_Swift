// The Swift Programming Language
// https://docs.swift.org/swift-book


import UIKit

public extension UIViewController {
    static func getTestVc() -> UIViewController {
        TestViewController()
    }
    
    static func getTestUIKitVc() -> UIViewController {
        if #available(iOS 17.0, *) {
            TestUIKitViewController()
        } else {
            UIViewController()
        }
    }
}

extension Notification.Name {
    static let userProfileUpdated = Notification.Name("UserProfileUpdated")
    static let dataSyncCompleted = Notification.Name("DataSyncCompleted")
}



struct TrainDidArriveMessage: NotificationCenter.MainActorMessage {
    typealias Subject = Train
    
    struct Train {
        
    }
}

extension UIViewController {
    func ad() {
        if #available(iOS 26.0, *) {
            NotificationCenter.default.post(TrainDidArriveMessage())
        } else {
            // Fallback on earlier versions
        }
        NotificationCenter.default.post(.init(name: .userProfileUpdated))
        
//        NotificationCenter.default.addObserver(of: <#T##AnyObject?#>, for: <#T##NotificationCenter.AsyncMessage.Type#>, using: <#T##(NotificationCenter.AsyncMessage) async -> Void#>)
    }
}
