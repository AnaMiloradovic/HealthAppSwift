//
//  ApiCalls.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 27.9.22..
//

import UIKit

class APIManager: NSObject{
    
    static let shared = APIManager()
    var userDefaults: String?
    
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
        
        request.httpBody = try? JSONEncoder().encode(newPassword)
        
        
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
                    
                    let object = try JSONDecoder().decode(ResetPasswordResult.self, from: data!)
                    print("Result is: \(object)")
                    print("Response is: \(String(describing: response))")
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
    
    // completion: @escaping (Result<LoginResponse, Error>) -> ()
    func postLogin() {
        
        //make url object
        guard let url = URL(string: "http://192.168.100.38:81/api/Identity/login") else {
            return
        }
        let newLogin = User(email: "jane@vhis.com", password: "P@ssw0rd")
        
        //make request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(newLogin)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("error \(httpResponse.statusCode)")
            }
            
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else{
                // data -> swift object
                do{
                    
                    let welcome = try JSONDecoder().decode(LoginResult.self, from: data!)
                    print("Result is: \(welcome)")
                    print("Role is: \(welcome.roles[0])")
                    
                    UserDefaults.standard.set(welcome.token, forKey: "savedToken")
                    UserDefaults.standard.set(welcome.roles[0], forKey: "savedRole")
                    
                    print("Response is: \(String(describing: response))")
                    print("****************************")
                    
                    // let res: Result? = welcome.result
                    // print("seniority is: \(res?.seniority)")
                }  catch let error as NSError {
                    print("failure to decode user from JSON")
                    print(error)
                    
                }
                
            }
        }.resume()
    }
    
    // POST request
    // url: "http://192.168.100.38:81/api/Appointment/createfordoctor"
    /*  func postDoctorsAppointment() {
     
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
     request.httpBody = try? JSONEncoder().encode(createAppointment)
     
     URLSession.shared.dataTask(with: request) {
     data, response, error in
     
     
     
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
     let object = try JSONDecoder().decode(ResponseGetAllAppointments.self, from: data!)
     print("Result is: \(object)")
     print("Response is: \(response)")
     print("****************************")
     
     }  catch let error as NSError {
     print("failure to decode user from JSON")
     print("ERROR: \(error)")
     }
     
     }.resume()
     }
     */
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
        request.httpBody = try? JSONEncoder().encode(getAll)
        
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("error:\(httpResponse.statusCode)")
                
            }
            
            // print("Data: ")
            // print(data as! NSData)
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else{
                // data -> swift object
                do{
                    
                    let object = try JSONDecoder().decode(ResponseGetAll.self, from: data!)
                    print("Result is: \(object)")
                    print("Response is: \(String(describing: response))")
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
    
    func postCreateDoctor(token: NSObject, doctor: CreateDoctor, completion: @escaping (Error?) -> ()) {
        
        //make url object
        guard let url = URL(string: "http://192.168.100.38:81/api/Doctor/create") else {
            return
        }
        //  let createDoctor = CreateDoctor(firstName: "Nick", lastName: "Johnson", email: "nickJ@gmail.com", password: "nick", address: "First bulevard 22", phone: "123-222-282", dateOfBirth: "1989-07-04T16:30:00", specialization: "Plastic surgeon", hoursPerDay: 12)
        
        let createDoctor = doctor
        
        //make request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.httpBody = try? JSONEncoder().encode(createDoctor)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to create new doctor!", error)
                return
            }
            
            guard let data = data else { return }
            
            completion(nil)
            
            do{
                let object = try JSONDecoder().decode(GetAllDoctors.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                // completion(.success(object))
                
            }  catch let error as NSError {
                print("Failure to create user! Try again! (user exists or password is not correct)")
                //print(error)
                //completion(.failure(error))
            }
        }.resume()
    }
    
    func postCreatePatient(token: NSObject, patient: CreatePatient, completion: @escaping (Error?) -> ()) {
        
        //make url object
        guard let url = URL(string: "http://192.168.100.38:81/api/Patient/create") else {
            return
        }
        
        let createPatient = patient
        
        //make request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.httpBody = try? JSONEncoder().encode(createPatient)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to create new patient!", error)
                return
            }
            
            guard let data = data else { return }
            
            completion(nil)
            
            do{
                let object = try JSONDecoder().decode(GetAllPatients.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                // completion(.success(object))
                
            }  catch let error as NSError {
                print("Failure to create user! Try again! (user exists or password is not correct)")
                //print(error)
                //completion(.failure(error))
            }
        }.resume()
    }
    
    
    func getAllAppointments(token: NSObject){
        
        let session = URLSession.shared
        guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/getall") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to fatch appointments", error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let object = try JSONDecoder().decode(ResponseGetAllAppointments.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                
            }  catch let error as NSError {
                print("failure to decode user from JSON")
                print(error)
            }
        }
        task.resume()
    }
    
    
    func getAllPatients(token: NSObject, completion: @escaping (Result<GetAllPatients, Error>) -> ()) {
        
        //1.create a URLRequest for an API endpoint
        guard let url = URL(string: "http://192.168.100.38:81/api/Patient/getall") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        //create sessionDataTask
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to fatch doctors", error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let object = try JSONDecoder().decode(GetAllPatients.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                completion(.success(object))
                
            }  catch let error as NSError {
                // print("failure to decode user from JSON")
                //print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /* func deleteDoctorWithId(id: String, token: NSObject, completion: @escaping (Error?) -> ()) {
     
     guard let url = URL(string: "http://192.168.100.38:81/api/Doctor/delete/\(id)") else {
     print("Error: cannot create URL")
     return
     }
     
     // Create the request
     var request = URLRequest(url: url)
     request.httpMethod = "DELETE"
     request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
     
     URLSession.shared.dataTask(with: request) { data, response, error in
     
     
     DispatchQueue.main.async {
     if let error = error {
     completion(error)
     return
     }
     
     if let response = response as? HTTPURLResponse, response.statusCode != 200 {
     let errorString = String(data: data ?? Data(), encoding: .utf8)
     ?? ""
     completion(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
     }
     }
     
     
     
     /*   do{
      let object = try JSONDecoder().decode(GetAllDoctors.self, from: data!)
      print("Response body: \(object)")
      print("****************************")
      
      
      }  catch let error as NSError {
      // print("failure to decode user from JSON")
      //print(error)
      
      } */
     }.resume()
     } */
    
    
    func getWithId(id: Int, token: NSObject){
        
        let session = URLSession.shared
        guard let url = URL(string: "http://192.168.100.38:81/api/Appointment/get/" + String(id)) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to fatch appointments", error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let object = try JSONDecoder().decode(GetAppointmentsWithID.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                
            }  catch let error as NSError {
                print("failure to decode user from JSON")
                print(error)
            }
        }
        task.resume()
    }
    
    
    func deleteDoctorWithId(id: String, token: NSObject, completion: @escaping (Error?) -> ()) {
                
                            guard let url = URL(string: "http://192.168.100.38:81/api/Doctor/delete/\(id)") else {
                                print("Error: cannot create URL")
                                return
                            }
                
                            // Create the request
                            var request = URLRequest(url: url)
                            request.httpMethod = "DELETE"
                            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
                            URLSession.shared.dataTask(with: request) { data, response, error in
                                
                                
                                DispatchQueue.main.async {
                                    if let error = error {
                                        completion(error)
                                        return
                                    }
                                
                                    if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                                        let errorString = String(data: data ?? Data(), encoding: .utf8)
                                            ?? ""
                                        completion(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                                    }
                                }
                                
                                
                               
                             /*   do{
                                    let object = try JSONDecoder().decode(GetAllDoctors.self, from: data!)
                                      print("Response body: \(object)")
                                      print("****************************")
                                      
                                     
                                  }  catch let error as NSError {
                                     // print("failure to decode user from JSON")
                                      //print(error)
                                    
                                  } */
                            }.resume()
                        }
    
    func deletePatientWithId(id: String, token: NSObject, completion: @escaping (Error?) -> ()) {
                
                            guard let url = URL(string: "http://192.168.100.38:81/api/patient/delete/\(id)") else {
                                print("Error: cannot create URL")
                                return
                            }
                
                            // Create the request
                            var request = URLRequest(url: url)
                            request.httpMethod = "DELETE"
                            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
                            URLSession.shared.dataTask(with: request) { data, response, error in
                                
                                
                                DispatchQueue.main.async {
                                    if let error = error {
                                        completion(error)
                                        return
                                    }
                                
                                    if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                                        let errorString = String(data: data ?? Data(), encoding: .utf8)
                                            ?? ""
                                        completion(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                                    }
                                }
                                
                            }.resume()
                        }
    
    
    func getAllDoctors(token: NSObject, completion: @escaping (Result<GetAllDoctors, Error>) -> ()) {
        
        //1.create a URLRequest for an API endpoint
        guard let url = URL(string: "http://192.168.100.38:81/api/Doctor/getall") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        //create sessionDataTask
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Failed to fatch doctors", error)
                return
            }
            
            guard let data = data else { return }
            
            do{
                let object = try JSONDecoder().decode(GetAllDoctors.self, from: data)
                print("Response body: \(object)")
                print("****************************")
                completion(.success(object))
                
            }  catch let error as NSError {
                // print("failure to decode user from JSON")
                //print(error)
                completion(.failure(error))
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
            
            // print("request is: \(data as! NSData)")
            
            if let error = error {
                print("Something went wrong with request: \(error.localizedDescription)")
                return
            }
            
            guard data != nil else{
                print("No data found.")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                print("\(httpResponse.allHeaderFields)")
                print(httpResponse.debugDescription)
            }
            
            // || data == nil
            if error != nil {
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
    
    
    
}
    
    // **** PUT REQUESTS ***
    //change note or patientid
  /*  func putUpdateAppointment(){
        
        
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
                    
                    //print("request is: \(data as! NSData)")
                    
                    guard error == nil else {
                        print("Error: error calling PUT")
                        print(error as Any)
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
                    
                    if error != nil  {
                        print("Client error!" )
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                        print("Server error!")
                        return
                    }
                    
                   do{
                        let object = try JSONDecoder().decode(ResponseGetAllAppointments.self, from: data)
                          print("Result is: \(object)")
                          print("Response is: \(response)")
                         
                         
                      }  catch let error as NSError {
                          print("failure to decode user from JSON")
                          print(error)
                          
                      }
                 
                }
                task.resume()
    } */
    
    
  
            

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
