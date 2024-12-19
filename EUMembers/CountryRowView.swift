//
//  CountryRowView.swift
//  EUMembers
//
//  Created by Rishu Kumar on 7.5.2023.
//

import Foundation
import SwiftUI

struct CountryRowView: View {
    var country: Country  // declaring a variable of type Country
    
    var body: some View {
        NavigationLink(destination: CountryView(country: country)) {  // creating a navigation link to CountryView passing the selected country as a parameter
            HStack {  // horizontal stack view
                Image(country.code.lowercased())  // displaying the country flag image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 20)
                    .border(Color.black, width: 1)  // adding a black border to the image
                Text(country.name)  // displaying the name of the country
                Spacer()  // adding a spacer to push the rest of the items to the right
                if country.isMember {  // displaying a star icon if the country is a member
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .frame(width: 25, height: 25)
                } else {  // displaying a filled star icon if the country is not a member
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                }
                if country.isEuroZone {  // displaying the euro currency symbol if the country is part of the euro zone
                    Text("\u{20AC}")
                        .foregroundColor(.green)
                        .frame(width: 25, height: 25)
                } else {  // displaying an empty space if the country is not part of the euro zone
                    Text("\u{20AC}")
                        .frame(width: 25, height: 25)
                }
                if country.isSchengen{  // displaying a checkmark icon if the country is part of the Schengen Area
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                        .frame(width: 25, height: 25)
                }else {  // displaying a filled checkmark icon if the country is not part of the Schengen Area
                    Image(systemName: "checkmark")
                        .foregroundColor(.gray)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

