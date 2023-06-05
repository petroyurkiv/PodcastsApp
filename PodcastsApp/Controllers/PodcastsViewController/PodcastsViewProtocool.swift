//
//  PodcastsViewProtocool.swift
//  PodcastsApp
//
//  Created by Petro on 05.06.2023.
//

import Foundation

protocol PodcastsViewProtocool: AnyObject {
    func fetchPodcasts()
    func goToSecondScreen(podcast: Podcast)
}
