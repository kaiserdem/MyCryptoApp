//
//  MyCryptoApp.swift
//  MyCrypto
//
//  Created by kaiserdem  on 08.03.2023.
//

import SwiftUI

@main
struct MyCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : Color.theme.accent]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : Color.theme.accent]
//    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
