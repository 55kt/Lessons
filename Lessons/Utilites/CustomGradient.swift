//
//  CustomGradient.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

public func customGradient(_ color1: Color, _ color2: Color, _ startPoint: UnitPoint, _ endPoint: UnitPoint) -> some View {
    LinearGradient(colors: [color1, color2], startPoint: startPoint, endPoint: endPoint)
        .ignoresSafeArea(.all)
}
