//
//  HeroModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/25/23.
//

import Foundation

struct Hero: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var photo: String
    var series: String
}

struct HerosFilter: Codable {
    var name: String
} // for server calls
