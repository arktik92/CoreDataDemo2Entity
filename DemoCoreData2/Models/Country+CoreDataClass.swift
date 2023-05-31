//
//  Country+CoreDataClass.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//
//
import Foundation
import CoreData

@objc(Country)
public class Country: NSManagedObject {
    public var wrappedName: String {
        name ?? "Unknown country"
    }

    public var cityArray: [City] {
        let set = city as? Set<City> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}
