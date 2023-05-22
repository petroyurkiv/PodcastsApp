//
//  EpisodesNetworkManager.swift
//  PodcastsApp
//
//  Created by Petro on 21.05.2023.
//

import Foundation

enum EpisodesNetworkManager {
    static func getEpisodes(podcastID: String, completion: @escaping(([Episode]) -> Void)) {
        let url = URL(string: "https://listen-api-test.listennotes.com/api/v2/podcasts")
        let newUrl = (url?.appendingPathComponent((podcastID), isDirectory: false))
        
        var request = URLRequest(url: newUrl!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Episodes.self, from: data)
                completion(result.episodes)
            } catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
