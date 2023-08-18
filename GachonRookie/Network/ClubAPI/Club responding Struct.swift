//
//  Club responding Struct.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation


struct data_postMakeReport: Codable {
    let postResult: String
}

struct data_postMakeClub: Codable {
    let addClubSuccess: String
}

struct data_postApply: Codable {
    let applyResult: String
}

struct data_getRegisterPage: Codable {
    let innerActiveList, innerNewList, innerEndList, outerActiveList: List
    let outerNewList, outerEndList: List
    
    // MARK: - List
    struct List: Codable {
        let typeTag, statusTag: String
        let clubs: [Club]
    }

    // MARK: - Club
    struct Club: Codable {
        let clubID: Int
        let clubName: String

        enum CodingKeys: String, CodingKey {
            case clubID = "clubId"
            case clubName
        }
    }

}



struct data_getRegisterDetailPage: Codable {
    let clubName, applyLink, activityStart, activityEnd: String
        let target: String
        let parts: [String]
        let reports: [Report]
    
    struct Report: Codable {
        let authorName, content, createdAt: String
    }
}

struct data_getMainDetailPage: Codable {
    let clubName, activityStartDate, activityEndDate, applyStartDate: String
        let applyEndDate, target: String
        let parts: [String]
}
