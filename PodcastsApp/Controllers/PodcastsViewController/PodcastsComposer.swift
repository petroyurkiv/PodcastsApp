//
//  PodcastsComposer.swift
//  PodcastsApp
//
//  Created by Petro on 15.06.2023.
//

import UIKit

enum PodcastsComposer {
     
    static func bulid(genreID: String) -> UIViewController {
        let presenter = PodcastsViewPresenter(genreID: genreID)
        let controller = PodcastsViewController(presenter: presenter)
        return controller
    }
}
