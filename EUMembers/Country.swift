//
//  Country.swift
//  EUMembers
//
//  Created by Rishu Kumar on 31.3.2023.
//

import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    
    var code: String
    var name: String
    var area: Int
    var population: Int
    var populationDensity: Int {
        return self.population / self.area
    }
    var isMember: Bool
    var isEuroZone: Bool
    var isSchengen: Bool
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case area
        case population
        case isMember
        case isEuroZone
        case isSchengen
    }
}
