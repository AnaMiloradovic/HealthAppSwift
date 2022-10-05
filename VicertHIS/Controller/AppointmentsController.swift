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
        
        view.backgroundColor = .systemYellow
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPurple

    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    

}
