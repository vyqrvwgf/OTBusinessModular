//
//  ViewController.swift
//  OTBusinessModular
//
//  Created by sanlazy on 04/12/2018.
//  Copyright (c) 2018 sanlazy. All rights reserved.
//

import UIKit
import OTBusinessModular

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
    }
    
    @objc private func tap() {
        let controller = OTBusinessController()
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 44.0)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
}

