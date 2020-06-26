//
//  ArtistsTableViewCell.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import UIKit

final class ArtistsTableViewCell: UITableViewCell {

    @IBOutlet weak private var thumbnailImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var listenersLabel: UILabel!


    var item: ArtistsCellData! {
        didSet {
            nameLabel.text = item.name
            listenersLabel.text = item.listeners

            if thumbnailImageView.image == nil, let url = item.imageURL{
                thumbnailImageView.loadImageFrom(url: url)
            }
        }
    }
}
