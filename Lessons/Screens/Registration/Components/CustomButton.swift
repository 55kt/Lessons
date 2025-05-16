//
//  CustomButton.swift
//  Lessons
//
//  Created by Vlad on 16/5/25.
//

import SwiftUI

struct CustomButton: View {
    var buttonName: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 300,height: 60)
                    .foregroundStyle(.white.opacity(0.3))
                    .padding()
                
                Text(buttonName)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    CustomButton(buttonName: "Button") {}
}
