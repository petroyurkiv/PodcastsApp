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
        GenresNetworkManager.getGenres { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.display(result)
            }
        }
    }
}
