//
//  GenresNetworkManager.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import Foundation

enum GenresNetworkManager {
    static func getGenres(completion: @escaping(([Genre]) -> Void)) {
        var request = URLRequest(url: URL(string: "https://listen-api-test.listennotes.com/api/v2/genres")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Genres.self, from: data)
                completion(result.genres)
            } catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
