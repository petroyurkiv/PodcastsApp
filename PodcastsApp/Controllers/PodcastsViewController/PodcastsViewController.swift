//
//  PodcastsViewController.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import UIKit

final class PodcastsViewController: UITableViewController {
    let presenter = PodcastsViewPresenter()
    var genre: Genre?
    private var models: [Podcast] = []
    private var podcast: Podcast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.texts.podcastAppPodcastsVCTitle()
        view.backgroundColor = .systemBackground
        tableView.register(PodcastsTableViewCell.self, forCellReuseIdentifier: PodcastsTableViewCell.identifier)
        presenter.view = self
        presenter.fetchPodcasts(genreID: (String(describing: genre?.id)))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PodcastsTableViewCell.identifier, for: indexPath) as! PodcastsTableViewCell
        let models = models[indexPath.row]
        cell.title.text = models.title
        cell.subtitle.text = models.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let podcast = models[indexPath.row]
        let screen = EpisodesViewController()
        screen.podcast = podcast
        self.navigationController?.pushViewController(screen, animated: true)
    }
}

extension PodcastsViewController: PodcastsViewProtocool {
    func display(_ podcasts: [Podcast]) {
        models = podcasts
        tableView.reloadData()
    }
}
