//
//  OcularLogApp.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 19/10/2023.
//

import SwiftUI

@main
struct OcularLogApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "Home")
                    }
                LogView()
                    .tabItem{
                        Label("Log", systemImage: "Book")
                    }
            }
            
        }
    }
}
