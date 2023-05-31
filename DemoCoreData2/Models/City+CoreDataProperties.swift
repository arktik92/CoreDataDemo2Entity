//
//  City+CoreDataProperties.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var country: Country?

}

extension City : Identifiable {

}
