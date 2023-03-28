//
//  HeroModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/28/23.
//

import Foundation

struct HeroModel: Codable {
    let id: String
    let name: String
    let photo: String
    let description: String
    let series: Comics
}
