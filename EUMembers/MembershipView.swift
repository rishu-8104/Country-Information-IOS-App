//
//  MembershipView.swift
//  EUMembers
//
//  Created by Rishu Kumar on 14.4.2023.
//

import SwiftUI

struct MembershipView: View {
    @Binding var country: Country
    
    var body: some View {
        HStack {
            if country.isMember {
                Image(systemName: "star")
                    .font(.system(size: 35))
                    .foregroundColor(.yellow)
            }
            
            if country.isEuroZone {
                Text("\u{20AC}")
                    .font(.system(size: 35))
            }
            if country.isSchengen{
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
                    .font(.system(size: 35))
            }
        }
    }
}
