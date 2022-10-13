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




