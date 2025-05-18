//
//  CustomGradient.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

public func customGradient(_ color1: Color, _ color2: Color) -> some View {
    LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
}
