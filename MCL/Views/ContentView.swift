//
//  ContentView.swift
//  MCL
//
//  Created by Eduardo Gonzalez Melgoza on 14/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showingSheet = false
    
    var body: some View {
        Text("Nothing here (:")
    }
}
