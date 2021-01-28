//
//  PracticeSessionDataModel.swift
//  FretelloCodingChallenge
//
//  Created by Chioma Mmegwa on 28/01/2021.
//

import UIKit

struct WelcomeElement: Codable {
    let name, practicedOnDate: String?
    let exercises: [Exercise]?
}

struct Exercise: Codable {
    let exerciseID, name: String?
    let practicedAtBPM: Int?

    enum CodingKeys: String, CodingKey {
        case exerciseID = "exerciseId"
        case name
        case practicedAtBPM = "practicedAtBpm"
    }
}
