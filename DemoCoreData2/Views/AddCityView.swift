//
//  AddCityView.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI

struct AddCityView: View {
    // CoreData
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var vm = CountryViewModel()
    var country: Country
    @State var cityName: String = ""
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $cityName)
            }
            Button {
                vm.addCity(moc: moc, country: country, cityName: cityName)
                dismiss()
            } label: {
                Text("Save")
            }

        }
        
    }
}

