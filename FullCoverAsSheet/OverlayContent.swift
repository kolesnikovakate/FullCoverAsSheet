//
//  OverlayContent.swift
//  FullCoverAsSheet
//
//  Created by Ekaterina Kolesnikova on 28.12.23.
//

import SwiftUI

struct OverlayContent: View {
    let text: String
    @Binding var isPresented: Bool
    @State private var count = 1
    
    private var textToShow: String {
        guard count > 1 else {
            return text
        }
        return Array(repeating: text, count: count).joined(separator: " ")
    }
    
    var body: some View {
        VStack {
            Spacer()
            overlayCard
        }
        .ignoresSafeArea(.all)
    }
    
    var overlayCard: some View {
        VStack(spacing: 24) {
            Text(textToShow)
            randomTextButton
            closeButton
                .padding(.bottom, 16)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private var closeButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.25)) {
                isPresented = false
            }
        } label: {
            Text("Close")
        }
    }
    
    private var randomTextButton: some View {
        Button {
            count = Int.random(in: 1..<10)
        } label: {
            Text("Randomize")
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.4).ignoresSafeArea()
        OverlayContent(text: "Preview text", isPresented: .constant(true))
    }
}
