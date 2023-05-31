//
//  CountryViewModel.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI
import CoreData


class CountryViewModel: ObservableObject {
    
    // MARK: - Ajout d'un pays et d'une ville
    func addCountry(moc: NSManagedObjectContext, name: String, cityName: String?, countryCode: String) {
        withAnimation {
            let newCountry = Country(context: moc)
            newCountry.timestamp = Date()
            newCountry.name = name
            newCountry.countryCode = countryCode
            
            if !cityName!.isEmpty {
                let newCity = City(context: moc)
                newCity.name = cityName
                newCountry.addToCity(newCity)
            }
            
            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // MARK: - Ajout d'une ville
    func addCity(moc: NSManagedObjectContext,country: Country, cityName: String?) {
        withAnimation {
                let newCity = City(context: moc)
                newCity.name = cityName
                country.addToCity(newCity)
            
            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func countryFlag(_ countryCode: String) -> String {
        String(String.UnicodeScalarView(countryCode.unicodeScalars.compactMap {
            UnicodeScalar(127397 + $0.value)
        }))
    }
}
