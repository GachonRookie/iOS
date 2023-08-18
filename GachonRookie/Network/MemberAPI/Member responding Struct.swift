//
//  Member responding Struct.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation

struct data_postUserLogin: Codable {
    let accessToken, refreshToken: String
}

// MARK: - data_getMainPage
struct data_getMainPage: Codable {
    let nickname: String
    let newClubResponse: NewClubResponse
    let notNewClubResponseList: [NotNewClubResponseList]
}

// MARK: - NewClubResponse
struct NewClubResponse: Codable {
    let clubID: Int
    let clubName, logourl: String

    enum CodingKeys: String, CodingKey {
        case clubID = "clubId"
        case clubName, logourl
    }
}

// MARK: - NotNewClubResponseList
struct NotNewClubResponseList: Codable {
    let recruitID: Int
    let clubName: String
    let gen: Int
    let logourl, recruitStatus: String
    let parts: [Part]

    enum CodingKeys: String, CodingKey {
        case recruitID = "recruitId"
        case clubName, gen, logourl, recruitStatus, parts
    }
}

// MARK: - Part
struct Part: Codable {
    let createdAt, updatedAt, status: String
    let partID: Int
    let clubID: ClubID
    let gen: Int
    let partName: String
    let recruitID: RecruitID

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, status
        case partID = "partId"
        case clubID = "clubId"
        case gen, partName
        case recruitID = "recruitId"
    }
}

// MARK: - ClubID
struct ClubID: Codable {
    let createdAt, updatedAt, status: String
    let clubID: Int
    let clubName, clubTag, adContent, snsLink: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, status
        case clubID = "clubId"
        case clubName, clubTag, adContent, snsLink
        case logoURL = "logoUrl"
    }
}

// MARK: - RecruitID
struct RecruitID: Codable {
    let createdAt, updatedAt, status: String
    let recruitID: Int
    let clubID: ClubID
    let gen: Int
    let target, recruitStartDate, recruitEndDate, activityStartDate: String
    let activityEndDate: String
    let parts: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt, updatedAt, status
        case recruitID = "recruitId"
        case clubID = "clubId"
        case gen, target, recruitStartDate, recruitEndDate, activityStartDate, activityEndDate, parts
    }
}
