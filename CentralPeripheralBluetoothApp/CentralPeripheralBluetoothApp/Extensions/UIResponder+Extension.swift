//
//  UIResponder+Extension.swift
//  CentralPeripheralBluetoothApp
//
//  Created by aleksanders on 15.01.2018.
//  Copyright © 2018 SaszaCorp. All rights reserved.
//

import UIKit

extension UIResponder {
    
    static var typeName: String {
        return String(describing: self)
    }
}
