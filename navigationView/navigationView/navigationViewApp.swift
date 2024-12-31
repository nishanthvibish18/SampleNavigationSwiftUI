//
//  navigationViewApp.swift
//  navigationView
//
//  Created by Nishanth on 29/07/24.
//

import SwiftUI

@main
struct navigationViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CustomNavigationPath())
        }
    }
}
