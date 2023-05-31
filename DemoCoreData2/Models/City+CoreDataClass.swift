//
//  City+CoreDataClass.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//
//

import Foundation
import CoreData

@objc(City)
public class City: NSManagedObject {
    public var wrappedName: String {
        name ?? "Unknown city"
    }
}

