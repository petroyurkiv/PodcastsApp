//
//  PodcastsViewController.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import UIKit

class PodcastsViewController: UITableViewController, ViewControllerDelegate {
    
    func passData(data: Int?) {
        guard let data = data else { return }
        genreID = data
    }
    
    var genreID: Int?
    var models: [Podcast] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcasts"
        view.backgroundColor = .systemBackground
        tableView.register(PodcastsTableViewCell.self, forCellReuseIdentifier: PodcastsTableViewCell.identifier)
        fetchPodcasts()
    }
    
    private func fetchPodcasts() {
        guard let genreID = genreID else { return }
        PodcastsNetworkManager.getPodcasts(genreID: genreID) { [self] result in
            models = result
            DispatchQueue.main.async {
                tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: PodcastsTableViewCell.identifier, for: indexPath) as! PodcastsTableViewCell
        let models = models[indexPath.row]
        cell.title.text = models.title
        cell.subtitle.text = models.description
        return cell
    }
}
