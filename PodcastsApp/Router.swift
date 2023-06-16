//
//  Router.swift
//  PodcastsApp
//
//  Created by Petro on 16.06.2023.
//

import UIKit

class Router {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showGenresViewAsRootController() {
        let viewController = GenresComposer.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showPodcastsView(navigationController: UINavigationController, genreID: String) {
        let viewController = PodcastsComposer.bulid(genreID: genreID)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showEpisodesView(navigationController: UINavigationController, podcastID: String) {
        let viewController = EpisodesComposer.build(podcastID: podcastID)
        navigationController.pushViewController(viewController, animated: true)
    }
}
