//
//  ValidationViewModel.swift
//  Lessons
//
//  Created by Vlad on 18/5/25.
//

import Foundation

struct ValidationViewModel {
    
    // MARK: - Email Validation
    public func validation(nickName: String?, email: String?, password: String?) -> ValidationError {
        
        /// Validates email and password for login or registration.
        /// - Parameters:
        ///   - email: The email address to validate.
        ///   - password: The password to validate.
        /// - Returns: A `ValidationError` indicating the result.
        
        // Проверка пустоты
        guard let nickName = nickName, !nickName.isEmpty else { return ValidationError.emptyNickName }
        guard let email = email, !email.isEmpty else { return ValidationError.emptyEmail }
        guard let password = password, !password.isEmpty else { return ValidationError.emptyPassword }

        // Проверка пробелов
        guard !email.contains(" ") else { return ValidationError.invalidEmail }
        guard !password.contains(" ") else { return ValidationError.invalidPasswordCharacters }
        
        // Проверка Unicode
        guard email.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidEmail
        }
        guard password.unicodeScalars.allSatisfy({ $0.isASCII }) else {
            return ValidationError.invalidPasswordCharacters
        }

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

        return ValidationError.success(email: email, password: password, nickName: nickName)
    }
}
