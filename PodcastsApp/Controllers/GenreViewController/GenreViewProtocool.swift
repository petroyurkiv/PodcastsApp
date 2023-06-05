//
//  GenreViewProtocool.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

protocol GenreViewProtocool: AnyObject {
    func fetchGenres()
    func goToSecondScreen(genre: Genre)
}
