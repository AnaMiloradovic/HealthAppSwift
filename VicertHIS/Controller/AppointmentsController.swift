//
//  AppointmentsController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 4.10.22..
//

import UIKit

class AppointmentsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(r: 17, g: 28, b: 0).cgColor, UIColor(r: 17, g: 28, b: 187).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white

    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    

}
