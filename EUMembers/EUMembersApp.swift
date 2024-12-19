//
//  EUMembersApp.swift
//  EUMembers
//
//  Created by Rishu Kumar on 31.3.2023.
//

import SwiftUI

let finland = Country(code: "FI", name: "Finland", area: 338_435, population: 5_555_300, isMember: true, isEuroZone: true, isSchengen: true)

@main
struct EUMembersApp: App {
    @StateObject private var manager = CountryManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
