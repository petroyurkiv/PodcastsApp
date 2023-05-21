//
//  PodcastsViewController.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import UIKit

class PodcastsViewController: UITableViewController, ViewControllerDelegate {
    
    func passData(data: String?) {
        guard let data = data else { return }
        genreID = data
    }
    
    private weak var delegate: ViewControllerDelegate?
    
    private func goToSecondScreen() {
        let screen = (storyboard?.instantiateViewController(withIdentifier: "EpisodesViewController")) as! EpisodesViewController
        delegate = screen
        guard let podcastID = podcastID else {
            return
        }
        delegate?.passData(data: podcastID)
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    var genreID: String?
    var models: [Podcast] = []
    var podcastID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcasts"
        view.backgroundColor = .systemBackground
        tableView.register(PodcastsTableViewCell.self, forCellReuseIdentifier: PodcastsTableViewCell.identifier)
        fetchPodcasts()
    }
    
    private func fetchPodcasts() {
        guard let genreID = genreID else { return }
        PodcastsNetworkManager.getPodcasts(podcastID: String(genreID)) { [self] result in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: PodcastsTableViewCell.identifier, for: indexPath) as! PodcastsTableViewCell
        let models = models[indexPath.row]
        cell.title.text = models.title
        cell.subtitle.text = models.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let models = models[indexPath.row]
        podcastID = models.id
        goToSecondScreen()
    }
}
