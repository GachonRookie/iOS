//
//  Club sending Struct.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation

struct send_postMakeClub: Codable {
    let clubName: String
    let clubType: Int
    let partList, applyLink, content: String
}

struct send_postApply: Codable {
    let clubId: Int
    let part: String
}

struct send_postMakeReport: Codable {
    let clubId: Int
    let content: String
}
