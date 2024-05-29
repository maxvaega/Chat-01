//
//  Chat01App.swift
//  Chat01
//
//  Created by Massimo Olivieri on 29/05/24.
//

import SwiftUI

@main
struct Chat01App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ChatView()
                    .navigationTitle("Chat")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gear")
                            }
                        }
                    }
            }
        }
    }
}
