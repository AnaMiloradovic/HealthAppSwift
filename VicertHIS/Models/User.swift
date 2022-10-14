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
struct LoginResponse: Codable {
    let errors: [String]?
    let token: String?
    let result: LoginResult?
    let roles: [String?]
}

// MARK: - Result
struct LoginResult: Codable {
    let seniority, id, firstName, lastName: String?
    let email, address, phone, dateOfBirth: String?

    enum CodingKeys: String, CodingKey {
        case seniority, id, firstName, lastName, email, address
        case phone = "phone:"
        case dateOfBirth
    }
}

// MARK: - ResetPasswordResponse
struct ResetPasswordResponse: Codable {
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


