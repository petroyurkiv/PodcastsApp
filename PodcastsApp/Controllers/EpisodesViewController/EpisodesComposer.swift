//
//  EpisodesComposer.swift
//  PodcastsApp
//
//  Created by Petro on 15.06.2023.
//

import UIKit

enum EpisodesComposer {
    
    static func build(podcastID: String) -> UIViewController {
        let presenter = EpisodesViewPresenter(podcastID: podcastID)
        let controller = EpisodesViewController(presenter: presenter)
        return controller
    }
}
