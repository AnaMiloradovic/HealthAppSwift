//
//  ViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    @objc func handleLogout(){
        present(LoginController(), animated: true, completion: nil)
    }


}

