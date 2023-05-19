//
//  PodcastsNetworkManager.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import Foundation

class PodcastsNetworkManager {
    static func getPodcasts(genreID: Int, completion: @escaping(([Podcast]) -> Void)) {
        var request = URLRequest(url: URL(string: "https://listen-api-test.listennotes.com/api/v2/best_podcasts?id=\(genreID)")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Podcasts.self, from: data)
                completion(result.podcasts)
            } catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
