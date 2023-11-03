//
//  LoadingView.swift
//  MarvelSwiftUI
//
//  Created by Eric Olsson on 11/3/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100, alignment: .center)
                .scaleEffect(animate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(), value: animate)
            Text("Downloading...")
                .bold()
        }
        .onAppear {
            self.animate = true
        }
        .onDisappear {
            self.animate = false
        }
    }
}

struct LoadingView_Preview: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
