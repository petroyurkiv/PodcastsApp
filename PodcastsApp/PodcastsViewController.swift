//
//  PodcastsViewController.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import UIKit

class PodcastsViewController: UIViewController, ViewControllerDelegate {
    
    func passData(data: String?) {
        guard let data = data else {
            text = "Error"
            return
        }
        text = data
    }
    
    var text: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        textLabel.textColor = .red
        textLabel.text = text
    }

}
