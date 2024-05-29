//
//  SettingsView.swift
//  Chat01
//
//  Created by Massimo Olivieri on 29/05/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("serverAddress") var serverAddress: String = "127.0.0.1:1001"
    
    var body: some View {
        Form {
            Section(header: Text("Server Settings")) {
                TextField("Server Address", text: $serverAddress)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
        }
        .navigationTitle("Settings")
    }
}
