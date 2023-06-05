//
//  EpisodesViewPresenter.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

class EpisodesViewPresenter {
    weak var view: EpisodesViewProtocool?
    
    func fetchEpisodes() {
        view?.fetchEpisodes()
    }
}
