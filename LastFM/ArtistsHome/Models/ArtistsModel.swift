//
//  ArtistsModel.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation

struct ArtistsModel: Codable {

    var mbid: String
    var name: String?
    var listeners: UInt?
    var image: [ArtistImage]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        listeners = UInt(try container.decode(String.self, forKey: .listeners))
        mbid = try container.decode(String.self, forKey: .mbid)
        image = try container.decode([ArtistImage].self, forKey: .image)

        
    }
}
