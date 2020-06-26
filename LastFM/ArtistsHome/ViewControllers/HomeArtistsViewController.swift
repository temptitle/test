//
//  ViewController.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/24/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//

import UIKit

final class HomeArtistsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataSource = [ArtistModel]()
    private var currentPage: UInt = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        getData(page: currentPage)
    }

    func getData(page: UInt) {
        let params = ArtistRequestParameters(page: page,
                                             country: "israel",
                                             format: "json")

        NetworkHelper.fetchObject(queryParams: params, type: ArtistsCallbackModel.self) { [weak self] result in

            switch result {
                case .success(let data):
                    if let artist = data.topartists?.artist {
                        //                CoreDataHelper.shared.save(artistModels: artist)
                        //                CoreDataHelper.shared.fetch()

                        self?.dataSource += artist

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

extension HomeArtistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistsTableViewCell",
                                                       for: indexPath) as? ArtistsTableViewCell else {
            return UITableViewCell()
        }

        cell.item = ArtistsCellData(item: dataSource[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}

extension HomeArtistsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 {
            currentPage += 1
            getData(page: currentPage)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let artistTopAlbumsViewController = storyboard?.instantiateViewController(withIdentifier: "ArtistTopAlbumsViewController") as? ArtistTopAlbumsViewController else {

            return
        }

        if let name = dataSource[indexPath.row].name {
            artistTopAlbumsViewController.artist = name
            navigationController?.pushViewController(artistTopAlbumsViewController, animated: true)
        }
    }
}
