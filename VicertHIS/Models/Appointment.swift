//
//  Appointment.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 29.9.22..
//

import UIKit


struct Appoitments {
    let date: String?
    let startTime: String?
    let patient: String?
}

struct DoctorsAppointments: Codable {
    let doctorId: String
    let startDate: Date  //"2022-09-20", YYYY-mm-dd
    let endDate: Date  //"2022-09-20", YYYY-mm-dd
    let duration: Int
    let hoursPerDay: Int
    let note: String?
}


// MARK: - ResponseDoctorsAppointments
struct ResponseGetAllAppointments: Codable {
    let errors: [String]?
    let token: String?
    let result: [GetAppointmentsResult]?
    let roles: [String]?
}

struct GetAppointmentsResult: Codable {
    let id: Int?
    let note: String?
    let date, startTime, endTime: String?
    let completed: Bool?
    let doctorID: String?
    let doctor: DoctorInfo?
    let patientID: String?
    let patient: DoctorInfo?

    enum CodingKeys: String, CodingKey {
        case id, note, date, startTime, endTime, completed
        case doctorID = "doctorId"
        case doctor
        case patientID = "patientId"
        case patient
    }
}

struct DoctorInfo: Codable {
    let specialization: String?
    let hoursPerDay: Int?
    let id: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let address: String?
    let phone: String?
    let dateOfBirth: String?
    let ssn: String?
}


struct GetAppointmentsWithID: Codable {
    let errors: [String]?
    let token: String?
    let result: ResultAppointmentWithId?
    let roles: [String]?
}

// MARK: - Result
struct ResultAppointmentWithId: Codable {
    let id: Int?
    let note, date, startTime, endTime: String?
    let completed: Bool?
    let doctorID: String?
    let doctor: DoctorApp?
    let patientID, patient: String?

    enum CodingKeys: String, CodingKey {
        case id, note, date, startTime, endTime, completed
        case doctorID = "doctorId"
        case doctor
        case patientID = "patientId"
        case patient
    }
}

// MARK: - Doctor
struct DoctorApp: Codable {
    let specialization: String?
    let hoursPerDay: Int?
    let id, firstName, lastName, email: String?
    let address, phone, dateOfBirth: String?
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
    let result: [AppointmentsResult]?
    let roles: [String?]
}



// MARK: - Result
struct AppointmentsResult: Codable {
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

