//
//  Appointment.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 29.9.22..
//

import UIKit


struct DoctorsAppointments: Codable {
    let doctorId: String
    let startDate: Date  //"2022-09-20", YYYY-mm-dd
    let endDate: Date  //"2022-09-20", YYYY-mm-dd
    let duration: Int
    let hoursPerDay: Int
    let note: String?
}


// MARK: - ResponseDoctorsAppointments
struct ResponseDoctorsAppointments: Codable {
    let errors: [String]? // String ili [Errors] ili []
    let token: String?
    let result: [ResultDoctorsAppointment?]?
    let roles: String?
    let type: String?
    let title: String?
    let status: Int?
    let traceID: String?

    enum CodingKeys: String, CodingKey {
        case errors, token, result, roles, type, title, status
        case traceID = "traceId"
    }
}


// MARK: - Errors
struct Errors: Codable {
    let completed, note: [String]
}


// MARK: - Result
struct ResultDoctorsAppointment: Codable {
    let id, note, date, startTime: String?
    let endTime: String?
    let completed: Bool?
    let doctorID: String?
    let patientID: String?

    enum CodingKeys: String, CodingKey {
        case id, note, date, startTime, endTime, completed
        case doctorID = "doctorId"
        case patientID = "patientId"
    }
}

struct AllUsers: Codable {
    let userId: String
    let startDate: String
    let endDate: String
}

// MARK: - ResponseGetAll
struct ResponseGetAll: Codable {
    let errors: [String?]
    let token: String?
    let result: [Result]?
    let roles: [String?]
}



// MARK: - Result
struct Result: Codable {
    let id, note: String?
    let date, startTime: String?
    let endTime: String?
    let completed: Bool?
    let doctorID, patientID: String?

    enum CodingKeys: String, CodingKey {
        case id, note, date, startTime, endTime, completed
        case doctorID = "doctorId"
        case patientID = "patientId"
    }
}


struct UpdateNotePatient: Codable {
       let appointmentId: Int
       let note: String
       let patientId: String
}

