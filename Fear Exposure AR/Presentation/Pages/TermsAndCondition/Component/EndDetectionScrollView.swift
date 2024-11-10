//
//  EndDetectionScrollView.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

import SwiftUI

struct EndDetectionScrollView<Content: View>: View {
    let axis: Axis.Set
    let showIndicators: Bool
    @Binding var hasScrolledToEnd: Bool
    let content: () -> Content
    
    @State private var visibleContentHeight: CGFloat = 0
    @State private var totalContentHeight: CGFloat = 0
    @State private var lastScrollOffset: CGFloat = 0
    
    init(_ axis: Axis.Set,
         showIndicators: Bool,
         hasScrolledToEnd: Binding<Bool>,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.axis = axis
        self.showIndicators = showIndicators
        self._hasScrolledToEnd = hasScrolledToEnd
    }
    
    var body: some View {
        ScrollView(axis, showsIndicators: showIndicators) {
            VStack {
                offsetReader // Track the current offset
                content()
                    .background(GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                totalContentHeight = geometry.size.height
                            }
                            .onChange(of: geometry.size.height, initial: true) {_, newHeight in
                                totalContentHeight = newHeight
                            }
                    })
            }
        }
        .background(GeometryReader { geometry in
            Color.clear
                .onAppear {
                    visibleContentHeight = geometry.size.height
                }
                .onChange(of: geometry.size.height, initial: true) {_,  newHeight in
                    visibleContentHeight = newHeight
                }
        })
        .coordinateSpace(name: "frameLayer")
        .onPreferenceChange(OffsetPreferenceKey.self) { offset in
            // Compare offset with total content size to detect end
            let isAtEnd = (totalContentHeight - visibleContentHeight) + offset <= 0
            hasScrolledToEnd = isAtEnd
            
            // Track last offset for debugging
            lastScrollOffset = offset
            print("Offset: \(offset), Total Content: \(totalContentHeight), Visible: \(visibleContentHeight), Is at end: \(isAtEnd)")
        }
    }
    
    private var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("frameLayer")).minY
                )
        }
        .frame(height: 0)
    }
}
