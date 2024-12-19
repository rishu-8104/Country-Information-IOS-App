//
//  CountryDetailsView.swift
//  EUMembers
//
//  Created by Rishu Kumar on 14.4.2023.
//

import SwiftUI

struct CountryDetailsView: View {
    @Binding var country: Country
    // You could use @State, but remember that if you
    // want to make a view for editing, you will need @Binding.
    
    var body: some View {
        VStack {
            MembershipView(country: $country)
            
            Text("Population: \(country.population)")
            Text("Area: \(country.area) km\u{B2}")
            Text("Population density: \(country.populationDensity) persons per km\u{B2}")
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: .constant(finland))
    }
}

