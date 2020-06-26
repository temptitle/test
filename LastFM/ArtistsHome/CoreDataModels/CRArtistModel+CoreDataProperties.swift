//
//  CRArtistModel+CoreDataProperties.swift
//  LastFM
//
//  Created by Mykhailo Melnychuk on 6/25/20.
//  Copyright © 2020 Mykhailo Melnychuk. All rights reserved.
//
//

import Foundation
import CoreData


extension CRArtistModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CRArtistModel> {
        return NSFetchRequest<CRArtistModel>(entityName: "CRArtistModel")
    }

    @NSManaged public var listeners: String?
    @NSManaged public var mbid: String?
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var image: NSSet?

}

// MARK: Generated accessors for image
extension CRArtistModel {

    @objc(addImageObject:)
    @NSManaged public func addToImage(_ value: CRArtistImage)

    @objc(removeImageObject:)
    @NSManaged public func removeFromImage(_ value: CRArtistImage)

    @objc(addImage:)
    @NSManaged public func addToImage(_ values: NSSet)

    @objc(removeImage:)
    @NSManaged public func removeFromImage(_ values: NSSet)

}
