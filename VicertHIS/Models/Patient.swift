//
//  Patient.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 3.11.22..
//

import UIKit


struct Patient{
    let firstName: String
    let lastName: String
    let email: String
    let phoneNumber: String
}

// MARK: - GetAllPatients
struct GetAllPatients: Codable {
    let errors: [String]?
    let token: String?
    let result: [PatientResult]?
    let roles: [String]?
}

// MARK: - Result
struct PatientResult: Codable {
    let ssn, id, firstName, lastName: String
    let email, address, phone, dateOfBirth: String?
}

struct CreatePatient: Codable {
    let firstName, lastName, email, password: String?
    let address, phone, dateOfBirth, ssn: String?

    enum CodingKeys: String, CodingKey {
        case firstName, lastName, email, password, address, phone, dateOfBirth, ssn
    }
}
