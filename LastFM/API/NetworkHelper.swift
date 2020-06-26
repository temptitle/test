//
//  NetworkHelper.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import Foundation

struct NetworkHelper {
    static func fetchObject<T: Codable> (queryParams: Parameters,
                                         type: T.Type,
                                         completion: @escaping (T?, Error?)->()) {
        var urlComps = URLComponents(string: "https://ws.audioscrobbler.com/2.0/")!
        urlComps.queryItems = queryParams.dictionaryRepresentation
        guard let URL = urlComps.url else { return }

        let request = URLRequest(url: URL)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            let result = try! JSONDecoder().decode(type.self, from: data)
            completion(result, error)
        }

        task.resume()
    }
}
