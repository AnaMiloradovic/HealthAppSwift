//
//  ResetPasswordController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit

class ResetPasswordController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backToLogin))
        

        // Do any additional setup after loading the view.
    }
    
    @objc func backToLogin(){
        present(LoginController(), animated: true, completion: nil)
    }
    

   

}
