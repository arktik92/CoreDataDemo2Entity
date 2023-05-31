//
//  ContentView.swift
//  DemoCoreData2
//
//  Created by Esteban SEMELLIER on 30/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var countryVM = CountryViewModel()
    
    // MARK: - Variables CoreData
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Country.timestamp, ascending: true)],
        animation: .default)
    var countries: FetchedResults<Country>
    
    // MARK: - Properties
    @State private var showAddCountryView: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(countries) { country in
                    NavigationLink {
                        CountryDetailView(country: country)
                    } label: {
                        
                        HStack {
                            Text(countryVM.countryFlag(country.countryCode ?? ""))
                                .padding(.trailing, 10)
                            Text(country.wrappedName)
                        }
                    }
                }
                .onDelete(perform: deleteCountry)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddCountryView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            Text("Select a Country")
        }
        .sheet(isPresented: $showAddCountryView) {
            AddCountryView()
        }
    }

    // MARK: - Functions
    // Delete
    private func deleteCountry(offsets: IndexSet) {
        withAnimation {
            offsets.map { countries[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

// MARK: - Helpers
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
