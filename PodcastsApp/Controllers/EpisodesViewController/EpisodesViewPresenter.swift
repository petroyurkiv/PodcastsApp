//
//  EpisodesViewPresenter.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

class EpisodesViewPresenter {
    weak var view: EpisodesViewProtocool?
    
    var podcastID: String
    
    init(podcastID: String) {
        self.podcastID = podcastID
    }
    
    func fetchEpisodes() {
        EpisodesNetworkManager.getEpisodes(podcastID: podcastID) { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.display(result)
            }
        }
    }
}
