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
    let errors: [String]? //JSONAny
    let token: String?   //JSONNull
    let result: [DoctorsResults]?
    let roles: [String?]
}

// MARK: - Result
struct DoctorsResults: Codable {
    let specialization: String?
    let hoursPerWeek: Int?
    let id: String
    let firstName,email, lastName : String
    let address, phone: String
    let dateOfBirth: String
}

struct CreateDoctor: Codable {
    let firstName, lastName, email, password: String?
    let address, phone, dateOfBirth, specialization: String?
    let hoursPerDay: Int?

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, password, address, phone, dateOfBirth, specialization
        case hoursPerDay = "HoursPerDay"
    }
}





