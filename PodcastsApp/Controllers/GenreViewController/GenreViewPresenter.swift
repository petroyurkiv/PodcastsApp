//
//  GenreViewPresenter.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

class GenreViewPresenter {
    weak var view: GenreViewProtocool?
    
    func fetchGenres() {
        view?.fetchGenres()
    }
    
    func goToSecondScreen(genre: Genre) {
        view?.goToSecondScreen(genre: genre)
    }
}
