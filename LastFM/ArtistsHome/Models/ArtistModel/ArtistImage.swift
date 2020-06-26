//
//  ArtistImage.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation
import CoreData

class ArtistImage: Codable {
    enum CodingKeys: String, CodingKey {
        case url = "#text", size
    }

    var url: String?
    var size: String?
}
