//
//  LoginView.swift
//  Lessons
//
//  Created by Vlad on 17/5/25.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    private let validator = ValidationViewModel()
    
    @State private var userNickName: String?
    @State private var userPassword: String?
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var isShowingSheet: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            customGradient(.blue, .pink, .topLeading, .bottomTrailing)
            
            ScrollView(.vertical, showsIndicators: false) {
                /// TextFields Area
                VStack {
                    /// Header Area
                    VStack {
                        Text("OceanScript")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .shadow(color: .white, radius: 0.8)
                            .padding(.top)
                        
                        Image("waveIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 180)
                    }// VStack
                    
                    Spacer()
                    
                    CustomTextField(textFieldName: "Никнейм", interiorText: "Введите ваш никнейм...", inputText: $userNickName)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    
                    CustomSecureField(secureFieldName: "Пароль", interiorText: "Введите ваш пароль...", inputText: $userPassword)
                    
                    CustomButton(buttonName: "Войти", action: {
                        let result = validator.validateLogin(nickName: userNickName, password: userPassword)
                        alertMessage = result.message
                        isShowingAlert = true
                    })
                    
                    Spacer()
                    
                    Button("У вас нет действующего аккаунта ? \n Создать аккаунт") {
                        isShowingSheet.toggle()
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .sheet(isPresented: $isShowingSheet) {
                        RegistrationView()
                    }// sheet
                }// VStack
            }// ScrollView
            .scrollDismissesKeyboard(.immediately)
            // MARK: - Alerts
            .alert("Результат ввода", isPresented: $isShowingAlert) {
                Button("Принять") { isShowingAlert = false }
            } message: {
                Text(alertMessage)
            }
        }// ZStack
    }// View
}// Body

// MARK: - Preview
#Preview {
    LoginView()
}
