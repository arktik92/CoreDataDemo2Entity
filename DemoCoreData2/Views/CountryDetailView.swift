//
//  CountryDetailView.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI

struct CountryDetailView: View {
    @ObservedObject var countryVM = CountryViewModel()
    @State var showAddCityView: Bool = false
    @State var country: Country
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) var cities: FetchedResults<City>
    
    var body: some View {
        VStack {
            Text(countryVM.countryFlag(country.countryCode ?? ""))
                .font(.system(size: 100))

            List {
                    ForEach(country.cityArray, id: \.self) { city in
                        Text(city.wrappedName)
                    }
                    .onDelete(perform: deleteCity)
            }
            .padding(.top, -50)
            .sheet(isPresented: $showAddCityView) {
                AddCityView(country: country)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddCityView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
        }
        }
    }
    private func deleteCity(offsets: IndexSet) {
        withAnimation {
            offsets.map { cities[$0] }.forEach(moc.delete)

            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

