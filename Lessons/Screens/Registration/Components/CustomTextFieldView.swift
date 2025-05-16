//
//  CustomTextFieldView.swift
//  Lessons
//
//  Created by Vlad on 16/5/25.
//

import SwiftUI

struct CustomTextFieldView: View {
    // MARK: - Properties
    var textFieldTitle: String
    var internalText: String
    @State var inputText: Binding<String?>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: -10) {
            Text(textFieldTitle)
                .font(.subheadline)
                .bold()
                .padding(.horizontal, -160)
                .foregroundStyle(.white)
            
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white.opacity(0.6))
                
                TextField(internalText, text: Binding(
                    get: { inputText.wrappedValue ?? "" },
                    set: { newValue in
                        inputText.wrappedValue = newValue.isEmpty ? nil : newValue
                    }))
                    .padding(.horizontal)
            }// ZStack
            .padding()
        }// VStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    CustomTextFieldView(textFieldTitle: "Title", internalText: "Enter your internal text here...", inputText: .constant(""))
}
