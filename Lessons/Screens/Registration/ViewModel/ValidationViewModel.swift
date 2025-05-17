//
//  ValidationViewModel.swift
//  Lessons
//
//  Created by Vlad on 16/5/25.
//

import Foundation

struct ValidationViewModel {
    
    // MARK: - Methods
    func validate(name: String?, surname: String?) -> ValidationError {
        
        guard let name = name else { return ValidationError.empty }
        guard name.count > 2 else { return ValidationError.tooShort }
        guard CharacterSet(charactersIn: name).isSubset(of: .letters) else { return ValidationError.invalidCharacters }
        
        guard let surname = surname else { return ValidationError.empty }
        guard surname.count > 2 else { return ValidationError.tooShort }
        guard CharacterSet(charactersIn: surname).isSubset(of: .letters) else { return ValidationError.invalidCharacters }
        
        return ValidationError.success(name: name, surname: surname)
    }
    
    // MARK: - Error Enum
    enum ValidationError: Error {
        case empty, tooShort, invalidCharacters, success(name: String, surname: String)
        
        var message: String {
            switch self {
            case .empty:
                return "Поле не может быть пустым. Пожалуйста введите текст"
            case .tooShort:
                return "Длина текста должна превышать более 4 символов"
            case .invalidCharacters:
                return "В тексте должны присутствовать только буквы"
            case .success(let name, let surname):
                return "Регистрация прошла успешно для пользователя \(name) \(surname)"
            }
        }
    }
}
