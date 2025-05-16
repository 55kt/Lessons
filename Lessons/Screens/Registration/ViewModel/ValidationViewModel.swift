//
//  ValidationViewModel.swift
//  Lessons
//
//  Created by Vlad on 16/5/25.
//

import Foundation

struct ValidationViewModel {
    
    // MARK: - Methods
    func validation(_ text: String?) -> ValidationError {
        guard let text = text else {
            return ValidationError.empty
        }
        
        return ValidationError.empty
    }
    
    // MARK: - Error Enum
    enum ValidationError: Error {
        case empty
        
        var message: String {
            switch self {
            case .empty:
                return "Ошибка. Поле не может быть пустым !"
            }
        }
    }
}
