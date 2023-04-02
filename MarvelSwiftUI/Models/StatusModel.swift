//
//  StatusModel.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/28/23.
//

import Foundation

enum Status {
    case none, loading, loaded, error(error: String)
}
