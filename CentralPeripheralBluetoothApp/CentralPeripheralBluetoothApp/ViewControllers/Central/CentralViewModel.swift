//
//  CentralViewModel.swift
//  CentralPeripheralBluetoothApp
//
//  Created by aleksanders on 15.01.2018.
//  Copyright © 2018 SaszaCorp. All rights reserved.
//

import CoreBluetooth

class CentralViewModel: NSObject {
    
    private var isBluetoothReady: Bool {
        didSet {
            if isBluetoothReady {
                startCentral()
            } else {
                stopCentral()
            }
        }
    }
    private var centralManager: CBCentralManager?
    
    override init() {
        isBluetoothReady = false
    }
    
    func initCentral() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startCentral() {
        guard isBluetoothReady else {
            return
        }
        
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func stopCentral() {
        guard let centralManager = centralManager else {
            return
        }
        centralManager.stopScan()
    }
}

extension CentralViewModel: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        isBluetoothReady = central.state == .poweredOn
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(advertisementData["CBAdvertisementDataLocalNameKey"])
        if let name = advertisementData["CBAdvertisementDataLocalNameKey"] as? String, name == Constants.peripheralName {
            print(name)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        
    }
}

extension CentralViewModel: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
    }
}
