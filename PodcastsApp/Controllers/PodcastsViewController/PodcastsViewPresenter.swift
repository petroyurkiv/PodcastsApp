//
//  PodcastViewPresenter.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

class PodcastsViewPresenter {
    weak var view: PodcastsViewController?
    
    func fetchPodcasts() {
        view?.fetchPodcasts()
    }
    
    func goToSecondScreen(podcast: Podcast) {
        view?.goToSecondScreen(podcast: podcast)
    }
}
