//
//  Starship.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-25.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import Foundation

struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let rating: String
    let cost: String
    let length: String
    let speed: String
    let crew: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case rating = "hyperdrive_rating"
        case cost = "cost_in_credits"
        case length
        case speed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
