//
//  OverlayBackground.swift
//  FullCoverAsSheet
//
//  Created by Ekaterina Kolesnikova on 28.12.23.
//

import SwiftUI

struct OverlayBackground: View {
    @Binding var isPresented: Bool
    let shouldDismissOnBackgroundTap: Bool
    
    var body: some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea(.all)
            .onTapGesture {
                if shouldDismissOnBackgroundTap {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isPresented = false
                    }
                }
            }
    }
}
