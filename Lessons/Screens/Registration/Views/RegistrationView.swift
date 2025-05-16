//
//  RegistrationView.swift
//  Lessons
//
//  Created by Vlad on 16/5/25.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    private let validator = ValidationViewModel()
    
    @State private var userName: String?
    @State private var userSurName: String?
    @State private var isAlertPresented: Bool = false
    @State private var alertMessage: String = ""
    
    // MARK: - Background
    var body: some View {
        ZStack {
            customGradient(.purple, .blue)
            
            /// Header
            VStack {
                /// Title
                VStack {
                    Text("OceanScript")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .shadow(color: .white, radius: 0.8)
                        .padding(.top)
                    
                    /// Icon
                    Image("waveIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }// VStack
                .padding(.bottom, -100)
                
                Spacer()
                
                /// Fields Area
                CustomTextFieldView(textFieldTitle: "Name", internalText: "Enter your name here...", inputText: $userName)
                
                CustomTextFieldView(textFieldTitle: "Surname", internalText: "Enter your surname here...", inputText: $userSurName)
                
                Spacer()
                
                CustomButton(buttonName: "Register") {
                    isAlertPresented = true
                    validator.validation(userName)
                    
                }
                
            }// VStack
        }// ZStack
        
        // MARK: - Alerts
        .alert("Ошибка", isPresented: $isAlertPresented) {
            Button("Ok") { isAlertPresented = false}
        } message: {
            Text(alertMessage)
        }
    }// Body
}// View

// MARK: - Preview
#Preview {
    RegistrationView()
}
