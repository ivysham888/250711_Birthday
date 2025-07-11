//
//  _50711_BirthdayApp.swift
//  250711_Birthday
//
//  Created by Ivy Sham on 11/7/2025.
//

import SwiftUI
import SwiftData

@main
struct _50711_BirthdayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
                // responsible for loading + saving data
        }
    }
}
