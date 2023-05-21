//
//  EpisodesViewController.swift
//  PodcastsApp
//
//  Created by Petro on 21.05.2023.
//

import UIKit

class EpisodesViewController: UITableViewController, ViewControllerDelegate {
    
    func passData(data: String?) {
        podcastID = data
    }
    
    private var podcastID: String?
    private var models: [Episodes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        fetchEpisodes()
    }
    
    private func fetchEpisodes() {
        guard let podcastID = podcastID else { return }
        EpisodesNetworkManager.getEpisodes(episodeID: podcastID) { [self] result in
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
        cell.textLabel?.text = models.title
        return cell
    }

}
