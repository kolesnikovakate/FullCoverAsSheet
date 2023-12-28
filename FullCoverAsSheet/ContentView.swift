//
//  ContentView.swift
//  FullCoverAsSheet
//
//  Created by Ekaterina Kolesnikova on 28.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            Button {
                withAnimation {
                    isPresented.toggle()
                }
            } label: {
                Text("Show view")
            }
            
            
        }
        .fullCoverAsSheet(isPresented: $isPresented) {
            OverlayContent(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                isPresented: $isPresented
            )
        }
    }
}

#Preview {
    ContentView()
}
