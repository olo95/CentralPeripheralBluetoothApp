//
//  PeripheralViewController.swift
//  CentralPeripheralBluetoothApp
//
//  Created by aleksanders on 15.01.2018.
//  Copyright © 2018 SaszaCorp. All rights reserved.
//

import UIKit

class PeripheralViewController: UIViewController {
    
    var viewModel = PeripheralViewModel()
    
    init() {
        super.init(nibName: PeripheralViewController.typeName, bundle: nil)
        tabBarItem = UITabBarItem(title: "Peripheral", image: nil, selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopPeripheral()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.initPeripheral()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
