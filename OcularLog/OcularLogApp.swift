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
                //TODO: fix logview duplicating.
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                LogView()
                    .tabItem{
                        Label("Log", systemImage: "book")
                    }
                ReviewView()
                    .tabItem{
                        Label("Review", systemImage: "calendar")
                    }
            }
            
        }
    }
}
