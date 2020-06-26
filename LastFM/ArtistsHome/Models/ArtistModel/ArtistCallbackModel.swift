//
//  ArtistsCallbackModel.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation

struct ArtistsCallbackModel: Codable {

    var topartists: ArtistsArrayModel?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        topartists = try container.decode(ArtistsArrayModel.self, forKey: .topartists)
    }
}
