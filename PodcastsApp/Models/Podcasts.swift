//
//  Podcasts.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import Foundation

struct Podcasts: Decodable {
    let podcasts: [Podcast]
}

struct Podcast: Decodable {
    let id: String
    let title: String
    let description: String
}
