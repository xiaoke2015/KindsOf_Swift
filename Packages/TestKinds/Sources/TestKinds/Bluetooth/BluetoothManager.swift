//
//  BluetoothManager.swift
//  TestKinds
//
//  Created by i-sens on 2025/11/27.
//

@preconcurrency import CoreBluetooth

public class BluetoothManager: NSObject, @unchecked Sendable {
    
    var centralManager: CBCentralManager?
    
    func initBluetooth() {
        if centralManager == nil {
            centralManager = CBCentralManager(delegate: self, queue: .global(qos: .userInteractive), options: nil)
        }
    }
    
    func stopScan() {
        centralManager?.stopScan()
    }
    
    func asyncScanForPeripherals() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.scanForPeripherals()
        }
    }
    
    func scanForPeripherals() {
        
        let option: [String: Any] = [
            CBCentralManagerOptionShowPowerAlertKey: true,
            CBCentralManagerOptionRestoreIdentifierKey: "csairiOSIdentifier",
            CBCentralManagerScanOptionAllowDuplicatesKey: true
        ]
        
        let services = [
            "C4DE7BDA-5A9D-11E9-8647-D663BD873D93",
            "C4DE9A20-5A9D-11E9-8647-D663BD873D93",
            "C4DE9DC2-5A9D-11E9-8647-D663BD873D93",
            "C4DEBB40-5A9D-11E9-8647-D663BD873D93",
            "C4DEBD98-5A9D-11E9-8647-D663BD873D93"]
            .compactMap({
            CBUUID(string: $0)
        })
        
        centralManager?.scanForPeripherals(withServices: services, options: option)
    }
}


extension BluetoothManager: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //
    }
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        peripheral.delegate = self
        
        centralManager?.connect(peripheral)
    }
}

extension BluetoothManager: CBPeripheralDelegate {
    public func peripheral(_ peripheral: CBPeripheral, didModifyServices invalidatedServices: [CBService]) {
        //
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: (any Error)?) {
        
        // 发现服务
        if let services = peripheral.services {
            for service in services {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: (any Error)?) {
        // 服务中发现特征
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                
                print("characteristic.uuid = \(characteristic.uuid as Any)")
            }
        }
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: (any Error)?) {
        if let re = characteristic.value {
            let s = String(data: re, encoding: .utf8)
            print("s = \(s as Any)")
        }
        switch characteristic.uuid.uuidString {
        case "2A29":
            break
        default:
            break
        }
        
        let handlerMap: [String: () -> Void] = [
            "2A29": {},
            "2A21": {}
        ]
        
        // 使用字典映射
        handlerMap[characteristic.uuid.uuidString]?()
    }
}

extension CBCharacteristic {
    
}

extension Data {
    var utf8: String? {
        String(data: self, encoding: .utf8)
    }
}
