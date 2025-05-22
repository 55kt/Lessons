//
//  ValidationViewModel.swift
//  Lessons
//
//  Created by Vlad on 18/5/25.
//

import Foundation

struct ValidationViewModel {
    
    // MARK: - Registration Validation
    public func validateRegistration(nickName: String?, email: String?, password: String?) -> ValidationError {
        
        /// Validates email, password and nickName for registration.
        /// - Parameters:
        ///   - email: The email address to validate.
        ///   - password: The password to validate.
        ///   - nickName: The nickName to validate.
        /// - Returns: A `ValidationError` indicating the result.
        
        // Проверка пустоты
        guard let nickName = nickName, !nickName.isEmpty else { return ValidationError.emptyNickName }
        guard let email = email, !email.isEmpty else { return ValidationError.emptyEmail }
        guard let password = password, !password.isEmpty else { return ValidationError.emptyPassword }
        
        // Проверка пробелов
        guard !nickName.contains(" ") else { return ValidationError.invalidNickNameCharacters }
        guard !email.contains(" ") else { return ValidationError.invalidEmail }
        guard !password.contains(" ") else { return ValidationError.invalidPasswordCharacters }
        
        // Проверка Unicode
        guard nickName.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidNickNameCharacters
        }
        guard email.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidEmail
        }
        guard password.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidPasswordCharacters
        }
        
        // Проверка длины nickname
        guard nickName.count >= 1 else { return ValidationError.tooShortNickName }
        guard nickName.count <= 20 else { return ValidationError.tooLongNickName }
        
        // Проверка длины email
        guard email.count <= 254 else { return ValidationError.tooManyEmailCharacters }
        guard email.components(separatedBy: "@").first?.count ?? 0 <= 64 else {
            return ValidationError.tooLongEmailLocalPart
        }
        
        // Проверка формата email
        let emailPattern = "^[A-Z0-9a-z._%+-]{1,64}@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        if !predicate.evaluate(with: email) {
            return ValidationError.invalidEmail
        }
        
        // Проверка длины пароля
        guard password.count >= 8 else { return ValidationError.tooShortPassword }
        guard password.count <= 128 else { return ValidationError.tooLongPassword }
        
        // Проверка состава пароля
        guard password.rangeOfCharacter(from: CharacterSet.letters) != nil else {
            return ValidationError.missingPasswordLetter
        }
        guard password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil else {
            return ValidationError.missingPasswordDigit
        }
        let specialCharacters = CharacterSet(charactersIn: ".,!@#$%^&*_-+=")
        guard password.rangeOfCharacter(from: specialCharacters) != nil else {
            return ValidationError.missingPasswordSpecial
        }
        
        return ValidationError.successRegistration(nickName: nickName, email: email, password: password)
    }
    
    // MARK: - Login Validation
    public func validateLogin(nickName: String?, password: String?) -> ValidationError {
        
        /// Validates nickName and password for login.
        /// - Parameters:
        ///   - nickName: The nickName to validate.
        ///   - password: The password to validate.
        /// - Returns: A `ValidationError` indicating the result.
        
        // Проверка пустоты
        guard let nickName = nickName, !nickName.isEmpty else { return ValidationError.emptyNickName }
        guard let password = password, !password.isEmpty else { return ValidationError.emptyPassword }
        
        // Проверка пробелов
        guard !nickName.contains(" ") else { return ValidationError.invalidNickNameCharacters }
        guard !password.contains(" ") else { return ValidationError.invalidPasswordCharacters }
        
        // Проверка Unicode
        guard nickName.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidNickNameCharacters
        }
        guard password.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidPasswordCharacters
        }
        
        // Проверка длины никнейма
        guard nickName.count >= 1 else { return ValidationError.tooShortNickName }
        guard nickName.count <= 20 else { return ValidationError.tooLongNickName }
        
        
        // Проверка длины пароля
        guard password.count >= 8 else { return ValidationError.tooShortPassword }
        guard password.count <= 128 else { return ValidationError.tooLongPassword }
        
        // Проверка состава пароля
        guard password.rangeOfCharacter(from: CharacterSet.letters) != nil else {
            return ValidationError.missingPasswordLetter
        }
        guard password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil else {
            return ValidationError.missingPasswordDigit
        }
        let specialCharacters = CharacterSet(charactersIn: ".,!@#$%^&*_-+=")
        guard password.rangeOfCharacter(from: specialCharacters) != nil else {
            return ValidationError.missingPasswordSpecial
        }
        
        return ValidationError.sucessLogin(nickName: nickName, password: password)
    }}
