//
//  ContentView.swift
//  EUMembers
//
//  Created by Rishu Kumar on 31.3.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: CountryManager  // declaring an environment object of type CountryManager
    
    var body: some View {
        NavigationView {  // creating a navigation view
            List {  // creating a list
                Section(header: Text("Current Members")) {  // creating a section for current members
                    ForEach(manager.countries.filter { $0.isMember }) { country in  // iterating through the list of countries and filtering only the current members
                        CountryRowView(country: country)  // displaying each country as a row in the list
                    }
                }
                
                Section(header: Text("Past Members")) {  // creating a section for past members
                    ForEach(manager.countries.filter { !$0.isMember }) { country in  // iterating through the list of countries and filtering only the past members
                        CountryRowView(country: country)  // displaying each country as a row in the list
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())  // applying the InsetGroupedListStyle to the list
            .navigationTitle("EU Members")  // setting the navigation title to "EU Members"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryManager())
    }
}
