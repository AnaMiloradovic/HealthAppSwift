//
//  ProfileController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 4.10.22..
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(r: 17, g: 28, b: 187).cgColor, UIColor(r: 255, g: 153, b: 255).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
    }
    
    @objc func handleLogout(){
        //dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
