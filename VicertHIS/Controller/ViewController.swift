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
        
        //getPosts()
        //postResetPassword()
        postLogin()
        //postData()
        
       
        
    }
    

    @objc func handleLogout(){
        present(LoginController(), animated: true, completion: nil)
    }
    
    func getData(){
        
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
