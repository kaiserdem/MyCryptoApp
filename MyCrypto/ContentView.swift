//
//  ContentView.swift
//  MyCrypto
//
//  Created by kaiserdem  on 08.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("accent")
                    .foregroundColor(Color.theme.accent)
                
                Text("SecondaryText")
                    .foregroundColor(Color.theme.SecondaryText)
                
                Text("red")
                    .foregroundColor(Color.theme.red)
                
                Text("green")
                    .foregroundColor(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
