//
//  Post.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 27.9.22..
//

import Foundation

struct ResetPassword: Codable {
    let email: String
    let oldPassword: String
    let newPassword: String
    let confirmNewPassword: String
}
