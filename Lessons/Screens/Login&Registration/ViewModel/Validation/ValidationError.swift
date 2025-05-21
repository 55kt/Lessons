//
//  ValidationError.swift
//  Lessons
//
//  Created by Vlad on 18/5/25.
//

import Foundation

enum ValidationError: Error {
    case emptyNickName
    case emptyEmail
    case emptyPassword
    case tooManyEmailCharacters
    case tooLongEmailLocalPart
    case invalidEmail
    case tooShortPassword
    case tooLongPassword
    case missingPasswordLetter
    case missingPasswordDigit
    case missingPasswordSpecial
    case invalidPasswordCharacters
    case success(email: String, password: String, nickName: String)
    
    var message: String {
        switch self {
        case .emptyNickName:
            return NSLocalizedString("Пожалуйста, введите ваш никнейм", comment: "Ошибка пустого никнейма")
        case .emptyEmail:
            return NSLocalizedString("Пожалуйста, введите email", comment: "Ошибка пустого email")
        case .emptyPassword:
            return NSLocalizedString("Пожалуйста, введите пароль", comment: "Ошибка пустого пароля")
        case .tooManyEmailCharacters:
            return NSLocalizedString("Email не должен превышать 254 символа", comment: "Ошибка длины email")
        case .tooLongEmailLocalPart:
            return NSLocalizedString("Локальная часть email не должна превышать 64 символа", comment: "Ошибка длины локальной части email")
        case .invalidEmail:
            return NSLocalizedString("Пожалуйста, введите корректный email-адрес (например, user@domain.com)", comment: "Ошибка некорректного email")
        case .tooShortPassword:
            return NSLocalizedString("Пароль должен содержать минимум 8 символов", comment: "Ошибка слишком короткого пароля")
        case .tooLongPassword:
            return NSLocalizedString("Пароль не должен превышать 128 символов", comment: "Ошибка слишком длинного пароля")
        case .missingPasswordLetter:
            return NSLocalizedString("Пароль должен содержать хотя бы одну букву", comment: "Ошибка отсутствия буквы в пароле")
        case .missingPasswordDigit:
            return NSLocalizedString("Пароль должен содержать хотя бы одну цифру", comment: "Ошибка отсутствия цифры в пароле")
        case .missingPasswordSpecial:
            return NSLocalizedString("Пароль должен содержать хотя бы один специальный символ (например, !@#$)", comment: "Ошибка отсутствия специального символа")
        case .invalidPasswordCharacters:
            return NSLocalizedString("Пароль не должен содержать пробелы или недопустимые символы", comment: "Ошибка недопустимых символов в пароле")
        case .success(let email, let nickName, _):
            return NSLocalizedString("Вход успешен для \(email)", comment: "Сообщение об успешном входе")
            
        }
    }
}
