//
//  CarMakeResponse.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation

// MARK: - CarMakeResponse
struct CarMakeResponse: Codable {
    let count: Int
    let message: String
    let results: [CarMake]

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case message = "Message"
        case results = "Results"
    }
}

// MARK: - Result
struct CarMake: Codable {
    let makeID: Int
    let makeName: String

    enum CodingKeys: String, CodingKey {
        case makeID = "Make_ID"
        case makeName = "Make_Name"
    }
}
