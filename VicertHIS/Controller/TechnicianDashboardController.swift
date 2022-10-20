//
//  TechnicianDashboardController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 20.10.22..
//

import UIKit

class TechnicianDashboardController: UITableViewController {

        
        let cellId = "cellId"
    
        var results = [DoctorsResults]()
        
        let savedToken = UserDefaults.standard.object(forKey: "savedToken")
        
        fileprivate func getAllDoctors(){
            APIManager.shared.getAllDoctors(token: savedToken as! NSObject){ (res) in
                switch res {
                case .failure(let error):
                    print("Failed to fetch doctors", error)
                case .success(let doctor):
                    print("Success")
                    self.results = doctor.result!
                   // print(doctors)
                  //  self.doctors = doctor
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }
            }
        }
        
       

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = UIColor.orange
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
            navigationItem.leftBarButtonItem?.tintColor = UIColor.white
            
            navigationItem.title = "Manage doctors"
          // navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
            navigationController?.navigationBar.prefersLargeTitles = true
            
            let image = UIImage(named: "plus2")
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleCreateDoctor))
            
            tableView.register(DoctorsCell.self, forCellReuseIdentifier: cellId)
            getAllDoctors()
         
        }
    
        @objc func handleCreateDoctor(){
            
            //when clicked on newMessage icon we want to launch our createDoctorController
            let createDoctor = CreateDoctorController()
            
            let navController = UINavigationController(rootViewController: createDoctor)
            present(navController, animated: true, completion: nil)
            
        }
        

        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return results.count
        }
        
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DoctorsCell
           cell.backgroundColor = .clear
           
           
           cell.doctorsName.text = results[indexPath.row].firstName + " " + results[indexPath.row].lastName
           cell.adressLabel.text = results[indexPath.row].address
           cell.birthLabel.text = results[indexPath.row].dateOfBirth.convertDateString()
           cell.phoneLabel.text = results[indexPath.row].phone
           cell.emailLabel.text = results[indexPath.row].email

             
           /*
            when we use an array oof doctors
            if let name = doctors[indexPath.item].name{
                cell.doctorsName.text = name
            }
            
            if let adress = doctors[indexPath.item].adress {
                  cell.adressLabel.text = adress
             }
             
             if let birth = doctors[indexPath.item].dateOfBirth{
                 cell.birthLabel.text = birth
             }
             
             if let phone = doctors[indexPath.item].phoneNumber{
                 cell.phoneLabel.text = phone
             }
             
             if let email = doctors[indexPath.item].email{
                 cell.emailLabel.text = email
             } */
             
           return cell
           
           }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(200)
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
           // let doctor = doctors[indexPath.row]
            
            let result = results[indexPath.row]
            
            let dc = DoctorProfileViewController(result: result)
            navigationController?.pushViewController(dc, animated: true)
        
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
