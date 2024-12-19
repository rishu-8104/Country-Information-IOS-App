//
//  CountryView.swift
//  EUMembers
//
//  Created by Rishu Kumar on 21.4.2023.
//

import SwiftUI

struct CountryView: View {
    @State var country: Country
    
    var body: some View {
        VStack {
            Text("\(country.name)")
                .font(.largeTitle)
            
            Image(country.code.lowercased())
                .resizable()
                .scaledToFit()
                .border(Color.black, width: 1)
            
            CountryDetailsView(country: $country)
            Button(action: {
                if let url = URL(string: "https://en.m.wikipedia.org/wiki/\(country.name.replacingOccurrences(of: " ", with: "_"))"){
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Learn more on Wikipedia")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(2)
            }
        }
        .padding()
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: finland)
    }
}
