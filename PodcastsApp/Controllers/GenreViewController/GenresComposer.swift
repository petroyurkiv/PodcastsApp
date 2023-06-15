//
//  GenresComposer.swift
//  PodcastsApp
//
//  Created by Petro on 15.06.2023.
//

import UIKit

enum GenresComposer {
    
   static func build() -> UIViewController {
       let presenter = GenresViewPresenter()
       let controller = GenresViewController()
       controller.presenter = presenter
       return controller
    }
}
