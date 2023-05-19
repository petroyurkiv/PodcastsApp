//
//  ViewController.swift
//  PodcastsApp
//
//  Created by Petro on 18.05.2023.
//

import UIKit

protocol ViewControllerDelegate: UIViewController {
    func passData(data: String?)
}

class GenreViewController: UITableViewController {
    
    weak var delegate: ViewControllerDelegate?
    
    func goToSecondScreen() {
        let screen = (storyboard?.instantiateViewController(withIdentifier: "PodcastsViewController")) as! PodcastsViewController
        delegate = screen
        guard let genreID = genreID else {
            return
        }
        delegate?.passData(data: String(genreID))
        self.navigationController?.pushViewController(screen, animated: true)
    }
    
    var models: [Genre] = []
    var genreID: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        getGenres()
    }

    private func getGenres() {
        var request = URLRequest(url: URL(string: "https://listen-api-test.listennotes.com/api/v2/genress")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Genres.self, from: data)
                print("\(result)")
                self.models = result.genres
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Error: \(error)")
            }
        }
        
        task.resume()
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

