//
//  CustomButton.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

struct CustomButton: View {
    // MARK: - Properties
    var buttonName: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(width: 300, height: 60)
                .foregroundStyle(.white.opacity(0.5))
                .padding()
                
                Text(buttonName)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
        }
    }// Body
}// View

// MARK: - Preview
#Preview {
    CustomButton(buttonName: "buttonName") {}
}
