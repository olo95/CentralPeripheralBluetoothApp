//
//  PeripheralViewModel.swift
//  CentralPeripheralBluetoothApp
//
//  Created by aleksanders on 15.01.2018.
//  Copyright © 2018 SaszaCorp. All rights reserved.
//

import CoreBluetooth

class PeripheralViewModel: NSObject {
    
    private var isBluetoothReady: Bool {
        didSet {
            if isBluetoothReady {
                startPeripheral()
            } else {
                stopPeripheral()
            }
        }
    }
    private var peripheralManager: CBPeripheralManager?
    
    override init() {
        isBluetoothReady = false
    }
    
    func initPeripheral() {
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func startPeripheral() {
        guard isBluetoothReady else {
            return
        }
        let data: [String: Any] = ["CBAdvertisementDataLocalNameKey": Constants.peripheralName]
        peripheralManager?.startAdvertising(data)
    }
    
    func stopPeripheral() {
        guard let peripheralManager = peripheralManager else {
            return
        }
        peripheralManager.stopAdvertising()
    }
}

extension PeripheralViewModel: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        isBluetoothReady = peripheral.state == .poweredOn
    }
}
