//
//  ViewController.swift
//  PodcastsApp
//
//  Created by Petro on 18.05.2023.
//

import UIKit

final class GenreViewController: UITableViewController {
    private var models: [Genre] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genres"
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        fetchGenres()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)!
        let models = models[indexPath.row]
        cell.textLabel?.text = models.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = models[indexPath.row]
        goToSecondScreen(genre: genre)
    }
    
    private func fetchGenres() {
        GenresNetworkManager.getGenres { [weak self] result in
            self?.models = result
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func goToSecondScreen(genre: Genre) {
        let screen = PodcastsViewController()
        screen.genre = genre
        self.navigationController?.pushViewController(screen, animated: true)
    }
}

