//
//  RegistrationView.swift
//  Lessons
//
//  Created by Vlad on 21/5/25.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @State private var userNickName: String?
    @State private var userEmail: String?
    @State private var userPassword: String?
    @State private var alertMessage: String = ""
    @State private var isShowingAlert: Bool = false
    private let validator = ValidationViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                customGradient(.pink, .blue)
                
                Image("waveIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .opacity(0.2)
                
                VStack {
                    
                    Text("Регистрация")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .shadow(color: .white, radius: 0.8)
                        .padding(.top)
                    
                    Spacer()
                    
                    CustomTextField(textFieldName: "Никнейм", interiorText: "Введите ваш никнейм...", inputText: $userNickName)
                    
                    CustomTextField(textFieldName: "Email", interiorText: "Введите ваш email адрес...", inputText: $userEmail)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    
                    CustomSecureField(secureFieldName: "Пароль", interiorText: "Введите ваш пароль...", inputText: $userPassword)
                    
                    CustomButton(buttonName: "Зарегистрироваться") {
                        let result = validator.validation(nickName: userNickName, email: userEmail, password: userPassword)
                        alertMessage = result.message
                        isShowingAlert.toggle()
                    }
                    
                    Spacer()
                    
                }// VStack
                
            }// ZStack
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Закрыть")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }// toolbar
        }// NavigationStack
        
        // MARK: - Alerts
        .alert("Результат ввода", isPresented: $isShowingAlert) {
            Button("Принять") { isShowingAlert = false }
        } message: {
            Text(alertMessage)
        }

    }// Body
}// View

// MARK: - Preview
#Preview {
    RegistrationView()
}

