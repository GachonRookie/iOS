//
//  Base Responding Struct.swift
//  Ourtine
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation

/// Server's Base Response
struct Response<T:Codable>: Codable {
    let code: Int   // status code
    let success: Bool
    let message: String // description
    let data: T   // put in Codable Struct to decode
}
