//
//  CustomTextField.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

struct CustomTextField: View {
    // MARK: - Properties
    var textFieldName: String
    var interiorText: String
    var inputText: Binding<String?>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: -10) {
            Text(textFieldName)
                .font(.subheadline)
                .bold()
                .padding(.horizontal, -160)
                .foregroundStyle(.white)
            
            
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white.opacity(0.6))
                
                TextField(interiorText, text: Binding(
                    get: { inputText.wrappedValue ?? "" },
                    set: { newValue in
                        inputText.wrappedValue = newValue.isEmpty ? nil : newValue
                    }))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                .submitLabel(.done)
                .padding(.horizontal)
            }// ZStack
            .padding()
        }// VStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    CustomTextField(textFieldName: "textFieldName", interiorText: "interiorText", inputText: .constant(""))
}
