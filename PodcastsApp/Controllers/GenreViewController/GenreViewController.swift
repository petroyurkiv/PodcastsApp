//
//  ViewController.swift
//  PodcastsApp
//
//  Created by Petro on 18.05.2023.
//

import UIKit

class PodcastComposer {
     
    func bulid(genreID: String) -> UIViewController {
        let presenter = PodcastsViewPresenter(genreID: genreID)
        let controller = PodcastsViewController(presenter: presenter)
        return controller
    }
}

final class GenreViewController: UITableViewController {
    let presenter = GenreViewPresenter()
    private var models: [Genre] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.texts.podcastAppGenreVCTitle()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        presenter.view = self
        presenter.fetchGenres()
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
        let screen = PodcastComposer().bulid(genreID: (String(describing: genre.id)))
        self.navigationController?.pushViewController(screen, animated: true)
    }
}

extension GenreViewController: GenreViewProtocool {
    func display(_ genres: [Genre]) {
        models = genres
        tableView.reloadData()
    }
}
