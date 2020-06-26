//
//  Parameters.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation

protocol Parameters {
    var dictionaryRepresentation: [URLQueryItem] { get }
}
