//
//  Login.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 27.9.22..
//

import UIKit
import Foundation


struct User: Codable {
    let email: String
    let password: String
}

struct ResetPassword: Codable {
    let email: String
    let oldPassword: String
    let newPassword: String
    let confirmNewPassword: String
}


// MARK: - LoginResponse
struct LoginResult: Codable {
    var errors: [String]?
    var token: String?
    var result: Login?
    var roles: [String]
}

// MARK: - Result
struct Login: Codable {
    let seniority, id, firstName, lastName: String?
    let email, address, phone, dateOfBirth: String?

    enum CodingKeys: String, CodingKey {
        case seniority, id, firstName, lastName, email, address
        case phone = "phone:"
        case dateOfBirth
    }
}

// MARK: - ResetPasswordResponse
struct ResetPasswordResult: Codable {
    let errors: [String?]
    let token, result: String? //JSONNull
    let roles: [String]?
    let type: String?
    let title: String?
    let status: Int?
    let traceID: String?

    enum CodingKeys: String, CodingKey {
        case errors, token, result, roles, type, title, status
        case traceID = "traceId"
    }
}


