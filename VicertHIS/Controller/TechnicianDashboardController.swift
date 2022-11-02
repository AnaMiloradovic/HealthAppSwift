//
//  TechnicianDashboardController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 20.10.22..
//

import UIKit

class TechnicianDashboardController: UITableViewController {

        
        let cellId = "cellId"

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = UIColor(r: 230, g: 230, b: 250)
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
            navigationItem.leftBarButtonItem?.tintColor = UIColor(r: 48, g: 25, b: 52)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
           
        }
    

        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
          
        }
        
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            cell.backgroundColor = .clear
           cell.accessoryType = .disclosureIndicator
           
           
           if indexPath.row == 0 {
               cell.textLabel?.text = "Manage doctors"
               if #available(iOS 16.0, *) {
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy, width: .standard)
               } else {
                   // Fallback on earlier versions
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
               }
               cell.textLabel?.textColor = UIColor(r: 48, g: 25, b: 52)
           }
           else if indexPath.row == 1 {
               cell.textLabel?.text = "Manage patients"
               if #available(iOS 16.0, *) {
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy, width: .standard)
               } else {
                   // Fallback on earlier versions
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
               }
               cell.textLabel?.textColor = UIColor(r: 48, g: 25, b: 52)
           }
           else if indexPath.row == 2 {
               cell.textLabel?.text = "Manage appointments"
               if #available(iOS 16.0, *) {
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy, width: .standard)
               } else {
                   // Fallback on earlier versions
                   cell.textLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
               }
               cell.textLabel?.textColor = UIColor(r: 48, g: 25, b: 52)
           }
           
            return cell
           
           }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(100)
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            if indexPath.row == 0 {
                let dc = ManageDoctorsController()
                navigationController?.pushViewController(dc, animated: true)
            }
            else if indexPath.row == 1 {
                let dc = ManagePatientsController()
                navigationController?.pushViewController(dc, animated: true)
            }
            else{
                let dc = ManageAppointmentsController()
                navigationController?.pushViewController(dc, animated: true)
            }
            
        }
    
        
        @IBAction func showAlertDialog(){
            
            // Declare Alert
                   let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to Logout?", preferredStyle: .alert)

                   // Create OK button with action handler
                   let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                        print("Ok button click...")
                        self.logoutFun()
                   })

                   // Create Cancel button with action handlder
                   let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                       print("Cancel button click...")
                   }

                   //Add OK and Cancel button to dialog message
                   dialogMessage.addAction(ok)
                   dialogMessage.addAction(cancel)

                   // Present dialog message to user
                   self.present(dialogMessage, animated: true, completion: nil)
            
        }
        
        @objc func handleLogout(){
            showAlertDialog()
        }
        
        func logoutFun(){
           // self.present(LoginController(), animated: true, completion: nil)
            UIApplication.shared.windows.first!.rootViewController = LoginController()
           
        }
        

    }
