//
//  ViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit


class ViewController: UITableViewController {
    
    var doctors = [GetAllDoctors]()
    let cellId = "cellId"
    let savedToken = UserDefaults.standard.object(forKey: "savedToken")
    
    fileprivate func getAllDoctors(){
        APIManager.shared.getAllDoctors(token: savedToken as! NSObject){ (res) in
            switch res {
            case .failure(let error):
                print("Failed to fetch doctors", error)
            case .success(let doctors):
                print("Success")
                print(doctors)
               // self.doctors = doctors
                //self.tableView.reloadData()
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.backgroundColor = .red
        
        let doctor = doctors[indexPath.row]
        
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPurple
        
        
       
        APIManager.shared.postLogin()
       // APIManager.shared.getAllAppointments(token: savedToken as! NSObject)
       //getAllDoctors()
        APIManager.shared.getWithId(id: 1788, token: savedToken as! NSObject)
       
        //APIManager.shared.postResetPassword()
        
       // APIManager.shared.postDoctorsAppointment()
       // APIManager.shared.postGetAllByUser()
        //APIManager.shared.getAll()
        
      //  APIManager.shared.deleteAppointmentWithId(id: 1)
       // APIManager.shared.putUpdateAppointment()
        //APIManager.shared.getAllDoctors()
    
    }
    

    @objc func handleLogout(){
        present(LoginController(), animated: true, completion: nil)
    }
}


/*
extension URLSession {
    
    func perform<Post: Decodable>(_ request: URLRequest, decode decodable: Post.Type, result: @escaping(Result<Post, Error>) -> Void){
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else{
                //dekodiramo data u swift object
                    let object = try? JSONDecoder().decode(Post.self, from: data!)
                    print("The email is: \(object?.email)")
                    print("The old password is: \(object?.oldPassword)")
                    print("The new password is: \(object?.newPassword)")
                    print("Confirmed password is: \(object?.confirmNewPassword)")
            }
        }.resume()
    }
}


let url = URL(string: "https://example.com")!
let request = URLRequest(url: url)

URLSession.perform(request, decode: Post.self) { (result) in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let object):
        print(object)
    }
}

*/
