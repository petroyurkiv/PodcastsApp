//
//  PodcastsNetworkManager.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import Foundation

class PodcastsNetworkManager {
    static func getPodcasts(podcastID: String, completion: @escaping(([Podcast]) -> Void)) {
        var components = URLComponents(string: "https://listen-api-test.listennotes.com/api/v2/best_podcasts")!
        components.queryItems = [
            URLQueryItem(name: "podcast_id", value: podcastID)
        ]
        
        var request = URLRequest(url: components.url!)
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
