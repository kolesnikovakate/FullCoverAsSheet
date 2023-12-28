//
//  FullCoverAsSheet.swift
//  FullCoverAsSheet
//
//  Created by Ekaterina Kolesnikova on 28.12.23.
//

import SwiftUI

extension View {
    func fullCoverAsSheet<Content>(isPresented: Binding<Bool>, shouldDismissOnBackgroundTap: Bool = true, content: @escaping () -> Content) -> some View where Content : View {
        self.overlay {
            if isPresented.wrappedValue {
                OverlayBackground(isPresented: isPresented, shouldDismissOnBackgroundTap: shouldDismissOnBackgroundTap)
                    .transition(.opacity)
                    .zIndex(0)
                
                content()
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(1)
            }
        }
    }
}
