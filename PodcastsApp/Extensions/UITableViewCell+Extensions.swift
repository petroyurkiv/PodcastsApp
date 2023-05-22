//
//  UITableViewCell+Extensions.swift
//  PodcastsApp
//
//  Created by Petro on 22.05.2023.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
