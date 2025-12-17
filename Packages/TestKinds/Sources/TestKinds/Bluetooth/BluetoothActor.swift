//
//  File.swift
//  TestKinds
//
//  Created by i-sens on 2025/11/28.
//

import Foundation
import CoreBluetooth

public actor BluetoothActor: NSObject {
    
    init(centralManager: CBCentralManager? = nil) {
        self.centralManager = centralManager
    }
    
    var centralManager: CBCentralManager?
    
    func initBluetooth() {
        if centralManager == nil {
//            centralManager = CBCentralManager(delegate: self, queue: .global(qos: .userInteractive), options: nil)
        }
    }
}

