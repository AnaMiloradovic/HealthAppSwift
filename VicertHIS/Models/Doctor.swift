//
//  Doctor.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit


struct Doctor {
    let name: String?
    let adress: String?
    let dateOfBirth: String?
    let phoneNumber: String?
    let email: String?
}


// MARK: - GetAllDoctors - response
struct GetAllDoctors: Codable {
    let errors: [String?]
    let token: String?
    let result: [DoctorsResults]?
    let roles: [String]?
}

// MARK: - Result
struct DoctorsResults: Codable {
    let specialization: String?
    let hoursPerWeek: Int?
    let id, firstName, lastName, email: String?
    let address, phone, dateOfBirth: String?
}

// MARK: - Helper functions for creating encoders and decoders


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func getAllDoctorsTask(with url: URL, completionHandler: @escaping (GetAllDoctors?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}



