//
//  PodcastsTableViewCell.swift
//  PodcastsApp
//
//  Created by Petro on 19.05.2023.
//

import UIKit

class PodcastsTableViewCell: UITableViewCell {
    
    static let identifier = "PodcastsTableViewCell"
    
    let title = UILabel()
    let subtitle = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configureTitle()
        configureSubtitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitle() {
        addSubview(title)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        setTitleConstraints()
    }
    
    private func configureSubtitle() {
        addSubview(subtitle)
        subtitle.textColor = .black
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        setSubtitleConstraints()
    }
    
    private func setTitleConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setSubtitleConstraints() {
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
