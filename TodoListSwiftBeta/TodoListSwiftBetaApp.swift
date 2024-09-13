//
//  TodoListSwiftBetaApp.swift
//  TodoListSwiftBeta
//
//  Created by Marco Alonso on 13/09/24.
//

import SwiftUI
import SwiftData

@main
struct TodoListSwiftBetaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
        //.modelContainer(for: [Video.self, Metadata.self])
        
    }
}
