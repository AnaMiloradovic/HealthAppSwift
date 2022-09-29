//
//  ApiCalls.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 27.9.22..
//

import UIKit




/*func postResetPassword() {
   
    let newPost = ResetPassword(email: "noviKorisnik@gmail.com", oldPassword: "staraSifra", newPassword: "novaSifra", confirmNewPassword: "novaSifra")
    
    //"https://jsonplaceholder.typicode.com/posts"
    //"http://192.168.100.38:81/api/Identity/resetpassword"
    //make url
    guard let url = URL(string: "http://192.168.100.38:81/api/Identity/resetpassword") else {
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
            print(" POST RESET PASSWORD -SUCCESS!")
            print("The email is: \(String(describing: object?.email))")
            print("The old password is: \(String(describing: object?.oldPassword))")
            print("The new password is: \(String(describing: object?.newPassword))")
            print("Confirmed password is: \(String(describing: object?.confirmNewPassword))")
            print("Response is: \(response as Any)")
        }
    }.resume()
} */


//"https://jsonplaceholder.typicode.com/posts"
//"http://192.168.100.38:81/api/Identity/login"

/*
func postData() {
   
    var data: Welcome
    //make url object
    guard let url = URL(string: "http://192.168.100.38:81/api/Identity/login") else {
        return
    }
   
  
    URLSession.shared.dataTask(with: url) {
        data, response, error in
        if let data = data {
            do{
                let decoder = JSONDecoder()
                let decoderData = try decoder.decode(Welcome.self, from: data)
                print("\(decoderData)")
            } catch {
                print("Error! Something get wrong")
            }
        }
       
    }.resume()
} */

func postLogin() {
   
    //make url object
    guard let url = URL(string: "http://192.168.100.38:81/api/Identity/login") else {
        return
    }
    let newLogin = User(email: "mark@example.com", password: "Mark.123")
    
    //make request object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try? newJSONEncoder().encode(newLogin)
  
    
    URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else{
            // data -> swift object
            do{
               
                let welcome = try newJSONDecoder().decode(Welcome.self, from: data!)
                print("Result is: \(welcome)")
                print("Response is: \(response)")
                print("****************************")
               // let res: Result? = welcome.result
               // print("seniority is: \(res?.seniority)")
            }  catch let error as NSError {
                print("failure to decode user from JSON")
                print(error)
                
            }
           // let object = try? JSONSerialization.jsonObject(with: data!, options: [])
            //print("\(object)")
           // print("\(response)")
            
        }
    }.resume()
}


// let dict = object as? [String:Any]
 //let email = dict?["email"]
// let password = dict?["password"]
 //let title = dict?["title"]
 //print("The title is: \(title)")
 //print("The email is: \(String(describing: email))")
 //print("The email is: \(String(describing: password))")
// print("*****************************************************************")


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
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else {
            //zameni Login sa klasom koju ces korisititi
            let jsonRes = try? JSONDecoder().decode(User.self, from: data!)
           // print("The response is: \(String(describing: jsonRes))")
            print("The response is: \(String(describing: jsonRes))")
        }
    }.resume()
}
