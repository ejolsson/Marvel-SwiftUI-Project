//
//  HeroView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 3/28/23.
//

import SwiftUI

struct HeroView: View {
    @EnvironmentObject var viewModel: HeroViewModel
    @State private var filter = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView().environmentObject(HeroViewModel())
    }
}
