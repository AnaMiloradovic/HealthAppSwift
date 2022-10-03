//
//  ApiCalls.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 27.9.22..
//

import UIKit




func postResetPassword() {
   
    let newPassword = ResetPassword(email: "noviKorisnik@gmail.com", oldPassword: "staraSifra", newPassword: "novaSifra", confirmNewPassword: "novaSifra")
    
    //"https://jsonplaceholder.typicode.com/posts"
    //"http://192.168.100.38:81/api/Identity/resetpassword"
    
    //make url object
    guard let url = URL(string: "http://192.168.100.38:81/api/Identity/resetpassword") else {
        return
    }
    
    //make request object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try? newJSONEncoder().encode(newPassword)
  
    
    URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        if let httpResponse = response as? HTTPURLResponse {
            print("error \(httpResponse.statusCode)")
        }
        
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else{
            // data -> swift object
           
            do{
               
                let object = try newJSONDecoder().decode(ResetPasswordResponse.self, from: data!)
                print("Result is: \(object)")
                print("Response is: \(response)")
                print("****************************")
               
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
        
        
        
        if let httpResponse = response as? HTTPURLResponse {
            print("error \(httpResponse.statusCode)")
        }
        
        
        print("Data: ")
        print(data as! NSData)
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else{
            // data -> swift object
            do{
               
                let welcome = try newJSONDecoder().decode(LoginResponse.self, from: data!)
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






// POST request
// url: "http://192.168.100.38:81/api/Appointment/createfordoctor"
func postDoctorsAppointment() {
   
    //make url object
    guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/createfordoctor") else {
        return
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let startDate = dateFormatter.date(from: "2022-09-20")!
    let endDate = dateFormatter.date(from: "2022-09-22")!
    
    let createAppointment = DoctorsAppointments(doctorId: "string", startDate: startDate, endDate: endDate , duration: 30, hoursPerDay: 6, note: "some note")
    
    //make request object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try? newJSONEncoder().encode(createAppointment)
  
    
    URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        print("Data: \(data)")
        print(data as! NSData)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
            print("\(httpResponse.allHeaderFields)")
            print(httpResponse.debugDescription)
        }
        
        if error != nil || data == nil {
            print("Client error! Data is nil" )
            return
        }
        
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        
        
        do{
                let object = try newJSONDecoder().decode(ResponseDoctorsAppointments.self, from: data!)
                print("Result is: \(object)")
                print("Response is: \(response)")
                print("****************************")
               
        }  catch let error as NSError {
                print("failure to decode user from JSON")
                print("ERROR: \(error)")
            }
         
    }.resume()
}

// POST request
// "http://192.168.100.38:81/api/Identity/login"
// url: "http://192.168.100.38:81/api/Appointment/createfordoctor"
func postGetAllByUser() {
   
    //make url object
    guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/getallbyuser") else {
        return
    }
    let getAll = AllUsers(userId: "string", startDate: "2022-09-29", endDate: "2022-09-29")
    
    //make request object
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = try? newJSONEncoder().encode(getAll)
  
    
    URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        if let httpResponse = response as? HTTPURLResponse {
            print("error:\(httpResponse.statusCode)")
            
        }
        
        print("Data: ")
        print(data as! NSData)
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else{
            // data -> swift object
            do{
               
                let object = try newJSONDecoder().decode(ResponseGetAll.self, from: data!)
                print("Result is: \(object)")
                print("Response is: \(response)")
                print("****************************")
               
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

/*
// GET REQUEST
func getAll(){
    // "https://jsonplaceholder.typicode.com/posts"
    // "http://192.168.100.38:81/api/Patient/getall"
    
    print("Getting the data from server- ALL APPOINTMENTS")
    // "http://192.168.100.38:81/api/Appointment/getall"
    guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/getall") else {
        return
    }
    //data- data retrieved from the server
    //response- url response
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
            //print("\(httpResponse.allHeaderFields)")
           // print(httpResponse.debugDescription)
        }
        
        if let error = error {
            print("There was an error: \(error.localizedDescription)")
        } else {
            
          /*  print("Data:")
            print(String(data: data!, encoding: .utf8) ?? "")
            print(response) */
            
            do{
                /*  let object = try newJSONDecoder().decode(ResponseGetAll.self, from: data!)
                  print("Result is: \(object)")
                  print("Response is: \(response)")
                  print("****************************") */
                 let object = try? JSONSerialization.jsonObject(with: data!, options: [])
                 print("\(object)")
                 print("\(response)")
                 
              }  catch let error as NSError {
                  print("failure to decode user from JSON")
                  print(error)
                  
              }
        }
    }.resume()
}
*/

func getAll(){
    
            let session = URLSession.shared
            guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/getall") else {
                return
            }
            
            let task = session.dataTask(with: url) { data, response, error in
                
                print("request is: \(data as! NSData)")
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                    print("\(httpResponse.allHeaderFields)")
                    print(httpResponse.debugDescription)
                }
                
                if error != nil || data == nil {
                    print("Client error!" )
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                
                do{
                     let object = try newJSONDecoder().decode(ResponseGetAll.self, from: data!)
                      print("Result is: \(object)")
                      print("Response is: \(response)")
                     
                     
                  }  catch let error as NSError {
                      print("failure to decode user from JSON")
                      print(error)
                      
                  }
            }
            task.resume()
        }


func getWithId(id: Int){
    
            let session = URLSession.shared
            guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/get/" + String(id)) else {
                return
            }
            
            let task = session.dataTask(with: url) { data, response, error in
                
                print("request is: \(data! as NSData)")
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                    print("\(httpResponse.allHeaderFields)")
                    print(httpResponse.debugDescription)
                }
                
                if error != nil || data == nil {
                    print("Client error!" )
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
                
                
                do{
                     let object = try newJSONDecoder().decode(ResponseGetAll.self, from: data!)
                      print("Result is: \(object)")
                      print("Response is: \(response)")
                     
                     
                  }  catch let error as NSError {
                      print("failure to decode user from JSON")
                      print(error)
                      
                  }
            }
            task.resume()
        }



func deleteAppointmentWithId(id: Int){
    
        
                let session = URLSession.shared
                guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/delete/" + String(id)) else {
                    print("Can not create url")
                    return
                }
    
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                let task = session.dataTask(with: request) { data, response, error in
                    
                    print("request is: \(data as! NSData)")
                    
                    if let error = error {
                        print("Something went wrong with request: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else{
                        print("No data found.")
                        return
                    }
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: \(httpResponse.statusCode)")
                        print("\(httpResponse.allHeaderFields)")
                        print(httpResponse.debugDescription)
                    }
                    
                    if error != nil || data == nil {
                        print("Client error!" )
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                        print("Server error!")
                        return
                    }
                
                    
                }
                task.resume()
            
}


// **** PUT REQUESTS ***
//change note or patientid
func putUpdateAppointment(){
    
    
            let session = URLSession.shared
            guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/update") else {
                print("Can not create url")
                return
            }

            //add data to data model
            let uploadData = UpdateNotePatient(appointmentId: 0, note: "string", patientId: "string")
    
            // Convert model to JSON data
            guard let jsonData = try? JSONEncoder().encode(uploadData) else {
                print("Error: Trying to convert model to JSON data")
                return
            }
    
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = session.dataTask(with: request) { data, response, error in
                
                print("request is: \(data as! NSData)")
                
                guard error == nil else {
                    print("Error: error calling PUT")
                    print(error)
                    return
                }
                
                guard let data = data else{
                    print("No data found.")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                    print("\(httpResponse.allHeaderFields)")
                    print(httpResponse.debugDescription)
                }
                
                if error != nil || data == nil {
                    print("Client error!" )
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
                
               do{
                    let object = try JSONDecoder().decode(ResponseDoctorsAppointments.self, from: data)
                      print("Result is: \(object)")
                      print("Response is: \(response)")
                     
                     
                  }  catch let error as NSError {
                      print("failure to decode user from JSON")
                      print(error)
                      
                  }
             
              //  let object = try? JSONSerialization.jsonObject(with: data, options: [])
                // print("\(object)")
                //print("\(response)")
            }
            task.resume()
}
