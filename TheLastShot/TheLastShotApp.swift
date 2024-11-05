//
//  TheLastShotApp.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

@main
struct TheLastShotApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZagruzkaView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
