//
//  CustomSecureField.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

struct CustomSecureField: View {
    var secureFieldName: String
    var interiorText: String
    var inputText: Binding<String?>
    @State private var isShowingPassword: Bool = false
    
    var body: some View {
        VStack(spacing: -10) {
            Text(secureFieldName)
                .font(.subheadline)
                .bold()
                .padding(.horizontal, -160)
                .foregroundStyle(.white)
            
            
            ZStack {
                Rectangle()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .foregroundStyle(.white.opacity(0.8))
                
                
                
                if isShowingPassword {
                    TextField(interiorText, text: Binding(
                        get: { inputText.wrappedValue ?? "" },
                        set: { newValue in
                            inputText.wrappedValue = newValue.isEmpty ? nil : newValue
                        }))
                    .padding(.horizontal)
                } else {
                    SecureField(interiorText, text: Binding(
                        get: { inputText.wrappedValue ?? "" },
                        set: { newValue in
                            inputText.wrappedValue = newValue.isEmpty ? nil : newValue
                        }))
                    .padding(.horizontal)
                }
                
                HStack {
                    Spacer()
                    eyeButton()
                        .padding()
                }// HStack
            }// ZStack
            .padding()
        }// VStack
    }// Body
    
    // MARK: - Methods
    private func eyeButton() -> some View {
        Button {
            isShowingPassword.toggle()
        } label: {
            Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
        }
    }
    
}// View

#Preview {
    CustomSecureField(secureFieldName: "secureFieldName", interiorText: "InteriorText", inputText: .constant(""))
}
