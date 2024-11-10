//
//  OffsetPreferenceKey.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 09/11/24.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
