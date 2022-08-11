//
//  CarModelResponse.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation

// MARK: - CarModelResponse
struct CarModelResponse: Codable {
    let count: Int
    let message, searchCriteria: String
    let results: [CarModel]

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case message = "Message"
        case searchCriteria = "SearchCriteria"
        case results = "Results"
    }
}

// MARK: - CarModel
struct CarModel: Codable {
    let makeID: Int
    let makeName: String
    let modelID: Int
    let modelName: String

    enum CodingKeys: String, CodingKey {
        case makeID = "Make_ID"
        case makeName = "Make_Name"
        case modelID = "Model_ID"
        case modelName = "Model_Name"
    }
}
