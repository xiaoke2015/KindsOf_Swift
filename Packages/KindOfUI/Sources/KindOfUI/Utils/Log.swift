//
//  Log.swift
//  KindOfUI
//
//  Created by i-sens on 2025/12/17.
//

public protocol LogDelegate {
    //
}

public extension LogDelegate where Self: Any {
    func log() {
        print(self)
    }
}

extension String: LogDelegate {}
