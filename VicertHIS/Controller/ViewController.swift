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
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPurple
        
        getPosts()
        //postResetPassword()
        postLogin()
      
    }
    

    
    func postResetPassword() {
       
        let newPost = ResetPassword(email: "noviKorisnik@gmail.com", oldPassword: "staraSifra", newPassword: "novaSifra", confirmNewPassword: "novaSifra")
        
        //"https://jsonplaceholder.typicode.com/posts"
        //"http://192.168.100.38:81/api/Identity/resetpassword"
        //make url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        
        //make request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(newPost)
      
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else{
                //dekodiramo data u swift object
                    let object = try? JSONDecoder().decode(ResetPassword.self, from: data!)
                //i add 'describing in order to silence the warning'
                print("SUCCESS!")
                print("The email is: \(String(describing: object?.email))")
                print("The old password is: \(String(describing: object?.oldPassword))")
                print("The new password is: \(String(describing: object?.newPassword))")
                print("Confirmed password is: \(String(describing: object?.confirmNewPassword))")
            }
        }.resume()
    }
    
    func postLogin() {
       
        let newLogin = Login(email: "ana7@gmail.com", password: "ana777")
        //"https://jsonplaceholder.typicode.com/posts"
        //"http://192.168.100.38:81/api/Identity/resetpassword"
        //make url object
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        //make request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(newLogin)
      
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else{
                //dekodiramo data u swift object
                    let object = try? JSONDecoder().decode(Login.self, from: data!)
                //i add 'describing in order to silence the warning'
                print("SUCCESS! \(String(describing: object))")
                print("The email is: \(String(describing: object?.email))")
                print("The password is: \(String(describing: object?.password))")
                
            }
        }.resume()
    }
    
    @objc func handleLogout(){
        present(LoginController(), animated: true, completion: nil)
    }
    
    // GET REQUEST
    func getPosts(){
        // "https://jsonplaceholder.typicode.com/posts"
        // "http://192.168.100.38:81/api/Patient/getall"
        
        print("Getting the data from server")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users" ) else {
            return
        }
        //data- data retrieved from the server
        //response- url response
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                print("The response is: \(jsonRes)")
            }
        }.resume()
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
