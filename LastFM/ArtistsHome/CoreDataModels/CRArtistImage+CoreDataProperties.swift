//
//  CRArtistImage+CoreDataProperties.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/25/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//
//

import Foundation
import CoreData


extension CRArtistImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CRArtistImage> {
        return NSFetchRequest<CRArtistImage>(entityName: "CRArtistImage")
    }

    @NSManaged public var size: String?
    @NSManaged public var url: String?
    @NSManaged public var artist: CRArtistModel?

}
