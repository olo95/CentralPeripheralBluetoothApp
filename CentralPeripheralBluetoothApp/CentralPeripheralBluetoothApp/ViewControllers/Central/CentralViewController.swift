//
//  CentralViewController.swift
//  CentralPeripheralBluetoothApp
//
//  Created by aleksanders on 15.01.2018.
//  Copyright © 2018 SaszaCorp. All rights reserved.
//

import UIKit

class CentralViewController: UIViewController {
    
    var viewModel = CentralViewModel()
    
    init() {
        super.init(nibName: CentralViewController.typeName, bundle: nil)
        tabBarItem = UITabBarItem(title: "Central", image: nil, selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopCentral()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.initCentral()
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
