//
//  ManagePatientsController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 2.11.22..
//

import UIKit

class ManagePatientsController: UITableViewController {
    
    let cellId = "cellId"
    static let shared = ManagePatientsController()

    let savedToken = UserDefaults.standard.object(forKey: "savedToken")
    var results = [PatientResult]()

     func getAllPatients(){
        APIManager.shared.getAllPatients(token: savedToken as! NSObject){ (res) in
            switch res {
            case .failure(let error):
                print("Failed to fetch patients", error)
            case .success(let patient):
                print("Success")
                self.results = patient.result!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 255, g: 250, b: 240)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        navigationItem.title = "Manage patients"
      // navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let image = UIImage(named: "plus2")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleCreatePatient))
        
        tableView.register(PatientsCell.self, forCellReuseIdentifier: cellId)
        getAllPatients()
     
    }

    @objc func handleCreatePatient(){
        
        //when clicked on newMessage icon we want to launch our createPatientController
        let createPatient = CreatePatientController()
        
        let navController = UINavigationController(rootViewController: createPatient)
        present(navController, animated: true, completion: nil)
        
    }
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
      
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PatientsCell
       cell.backgroundColor = .clear
       
       
       cell.patientName.text = results[indexPath.row].firstName + " " + results[indexPath.row].lastName
       cell.adressLabel.text = results[indexPath.row].address
       cell.birthLabel.text = results[indexPath.row].dateOfBirth!.convertDateString()
       cell.phoneLabel.text = results[indexPath.row].phone
       cell.emailLabel.text = results[indexPath.row].email
         
       return cell
       
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let result = results[indexPath.row]
        
       // let dc = DoctorProfileViewController(result: result)
        let dc = PatientProfileViewController(result: result)
        navigationController?.pushViewController(dc, animated: true)
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("Delete patient")
            let patient = self.results[indexPath.row]
            APIManager.shared.deletePatientWithId(id: patient.id, token: savedToken as! NSObject) { (error) in
                if let error = error {
                    print("Failed to delete:", error)
                    return
                }
                
            }
            print("Successfully deleted patient from server")
            self.results.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            }
        }
/*
override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
        print("Delete doctor")
        let doctor = self.results[indexPath.row]
        APIManager.shared.deleteDoctorWithId(id: doctor.id, token: savedToken as! NSObject) { (error) in
            if let error = error {
                print("Failed to delete:", error)
                return
            }
            
        }
        print("Successfully deleted post from server")
        self.results.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        }
    }*/


    
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
