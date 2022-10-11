//
//  FindCareController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit

class FindCareController: UITableViewController {
    
    let cellId = "cellId"
    
    let doctors: [Doctor] = {
        
        let doctor1 = Doctor(name: "Kaiden Sidney", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "May 17, 1979", phoneNumber: "123-123-1234", email: "kaiden.sidney@vhis.com")
        let doctor2 = Doctor(name: "Cornell Ellison", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jan 29, 1974", phoneNumber: "123-123-1234", email: "cornell.ellison@vhis.com")
        let doctor3 = Doctor(name: "Douglas Loman", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jun 11, 1978", phoneNumber: "123-123-1234", email: "douglas.loman@vhis.com")
        let doctor4 = Doctor(name: "Virginia Apgar", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jan 01, 1970", phoneNumber: "123-1234-123", email: "virginia.apgar@vhis.com")
        return [doctor1, doctor2, doctor3, doctor4]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        
        //view.backgroundColor = UIColor(r: 244, g: 241, b: 255)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.title = "Doctors"
      // navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor(r: 255, g: 241, b: 255)
        
        tableView.register(DoctorsCell.self, forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
    //GRADIENT
    func applyGradient()
        {

            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = tableView.bounds
           
            //[UIColor(r: 17, g: 28, b: 60).cgColor, UIColor(r: 17, g: 28, b: 500).cgColor]
            gradientLayer.colors = [UIColor(r: 17, g: 28, b: 187).cgColor, UIColor(r: 255, g: 153, b: 255).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)

            let backgroundView = UIView(frame: tableView.bounds)
            backgroundView.layer.insertSublayer(gradientLayer, at: 0)

            tableView.backgroundView = backgroundView
        }
      
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            applyGradient()
        }
   
   

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DoctorsCell
       cell.backgroundColor = .clear
       
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
       }
       
        return cell
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let doctor = doctors[indexPath.row]
        
        let dc = DoctorProfileViewController(doctor: [doctor])
        navigationController?.pushViewController(dc, animated: true)
       // showDoctorsInfo()
        
       /*
        let dc = DoctorProfileViewController()
        let navController = UINavigationController(rootViewController: dc)
       // navigationController?.pushViewController(navController, animated: true)
        present(navController, animated: true, completion: nil) */
        
    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
   /*  func showDoctorsInfo() {
         let navController  =  DoctorProfileViewController(doctors: <#[Doctor]#>)
        navController.doctors = doctors
        navigationController?.pushViewController(navController, animated: true)
        print(123)
        
    }*/
    
    



}


