//
//  Film.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-25.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import Foundation

struct Film : Codable {
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseData: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case crawl = "opening_crawl"
        case director
        case producer
        case releaseData = "release_date"
    }
}
