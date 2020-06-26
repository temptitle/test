//
//  ArtistArrayModel.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation

struct ArtistsArrayModel: Codable {

    var artist: [ArtistModel]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artist = try container.decode([ArtistModel].self, forKey: .artist)
    }
}
