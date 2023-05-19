//
//  ViewController.swift
//  PodcastsApp
//
//  Created by Petro on 18.05.2023.
//

import UIKit

protocol ViewControllerDelegate: UITableViewController {
    func passData(data: Int?)
}

class GenreViewController: UITableViewController {
    
    private weak var delegate: ViewControllerDelegate?
    
    private func goToSecondScreen() {
        let screen = (storyboard?.instantiateViewController(withIdentifier: "PodcastsViewController")) as! PodcastsViewController
        delegate = screen
        guard let genreID = genreID else {
            return
        }
        delegate?.passData(data: genreID)
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    private var models: [Genre] = []
    private var genreID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genres"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        fetchGenres()
    }
    
    private func fetchGenres() {
        GenresNetworkManager.getGenres { [self] result in
            models = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        let models = models[indexPath.row]
        cell.textLabel?.text = models.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let models = models[indexPath.row]
        genreID = models.id
        goToSecondScreen()
    }
}

