//
//  AddCountryView.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI

struct AddCountryView: View {
    // MARK: - CoreData
    @Environment(\.managedObjectContext) private var moc
    
    // MARK: - Environment
    @Environment(\.dismiss) private var dismiss
    // MARK: - Class
    @ObservedObject var countryVM = CountryViewModel()
    
    // MARK: - Properties
    @State var selectedCountry = ""
    @State var flag: String = "FR"
    @State var country: String = ""
    @State var city: String = ""
    
    var body: some View {
        VStack {
            Form {
                TextField("Country", text: $country)
                    .autocorrectionDisabled(true)
                TextField("City", text: $city)
                    .autocorrectionDisabled(true)
                Picker("flag", selection: $flag) {
                    ForEach(NSLocale.isoCountryCodes, id: \.self) { countryCode in
                        HStack {
                            Text(countryVM.countryFlag(countryCode) + ":  " + (Locale.current.localizedString(forRegionCode: countryCode) ?? ""))
                            
                        }
                    }
                }
                
            }
            Button("Add") {
                countryVM.addCountry(moc: moc, name: country.trimmingCharacters(in: .whitespacesAndNewlines), cityName: city, countryCode: flag)
                dismiss()
            }
        }
    }
}
