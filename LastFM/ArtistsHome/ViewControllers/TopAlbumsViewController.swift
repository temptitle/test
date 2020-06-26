//
//  ArtistTopAlbumViewController.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import UIKit

final class TopAlbumsViewController: UIViewController {
    var artist: String = ""

    @IBOutlet weak var tableView: UITableView!
    private var dataSource = [AlbumModel]()


    override func viewDidLoad() {
        super.viewDidLoad()

        let params = TopAlbumsRequestParameters(artist: artist)

        NetworkHelper.fetchObject(queryParams: params, type: AlbumsCallbackModel.self) { [weak self] result in
            switch result {
            case .success(let data):
                if let albums = data.topalbums?.album {
                    //                CoreDataHelper.shared.save(artistModels: artist)
                    //                CoreDataHelper.shared.fetch()

                    self?.dataSource = albums

                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
            }

            case .failure(let error):
                print(error)


            }
        }
        
    }
}

extension TopAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumsTableViewCell",
                                                       for: indexPath) as? AlbumsTableViewCell else {
                                                        return UITableViewCell()
        }

        cell.item = AlbumsCellData(item: dataSource[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
