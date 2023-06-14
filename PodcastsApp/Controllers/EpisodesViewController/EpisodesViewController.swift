//
//  EpisodesViewController.swift
//  PodcastsApp
//
//  Created by Petro on 21.05.2023.
//

import UIKit

final class EpisodesViewController: UITableViewController {
    let presenter = EpisodesViewPresenter()
    var podcast: Podcast?
    private var models: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.texts.podcastAppEpisodesVCTitle()
        view.backgroundColor = .systemBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        presenter.view = self
        presenter.fetchEpisodes(podcastID: (String(describing: podcast?.id)))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)!
        let episode = models[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
}

extension EpisodesViewController: EpisodesViewProtocool {
    func display(_ episodes: [Episode]) {
        models = episodes
        tableView.reloadData()
    }
}
