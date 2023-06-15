//
//  PodcastViewPresenter.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

class PodcastsViewPresenter {
    weak var view: PodcastsViewProtocool?
    
    var genreID: String
    
    init(genreID: String) {
        self.genreID = genreID
    }
    
    func fetchPodcasts() {
        PodcastsNetworkManager.getPodcasts(genreID: genreID) { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.display(result)
            }
        }
    }
}
