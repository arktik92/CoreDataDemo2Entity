//
//  Country+CoreDataProperties.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var city: NSSet?

}

// MARK: Generated accessors for city
extension Country {

    @objc(addCityObject:)
    @NSManaged public func addToCity(_ value: City)

    @objc(removeCityObject:)
    @NSManaged public func removeFromCity(_ value: City)

    @objc(addCity:)
    @NSManaged public func addToCity(_ values: NSSet)

    @objc(removeCity:)
    @NSManaged public func removeFromCity(_ values: NSSet)

}

extension Country : Identifiable {

}
