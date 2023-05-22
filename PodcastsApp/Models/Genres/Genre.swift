//
//  Genre.swift
//  PodcastsApp
//
//  Created by Petro on 22.05.2023.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
    let parentID: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case parentID = "parent_id"
    }
}
