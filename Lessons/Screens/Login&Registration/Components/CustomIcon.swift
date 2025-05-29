//
//  CustomIcon.swift
//  Lessons
//
//  Created by Vlad on 29/5/25.
//

import SwiftUI

struct GradientButton: View {
    // Свойства кнопки
    let title: String
    let action: () -> Void
    
    // Состояние для анимации градиента
    @State private var isTapped: Bool = false
    @State private var gradientColors: [Color] = [.blue, .purple]
    
    // Начальные и конечные цвета для анимации
    private let startColors: [Color] = [.blue, .purple]
    private let endColors: [Color] = [.pink, .orange]
    
    var body: some View {
        Button(action: {
            // Выполняем действие кнопки
            action()
            // Запускаем анимацию градиента
            withAnimation(.easeInOut(duration: 0.5)) {
                isTapped.toggle()
                gradientColors = isTapped ? endColors : startColors
            }
        }) {
            // Отображаем текст кнопки с градиентом
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 5)
        }
        .padding(.horizontal)
        .onAppear {
            // Устанавливаем начальные цвета
            gradientColors = startColors
        }
    }
}

#if DEBUG
#Preview {
    GradientButton(title: "Tap Me!") {
        print("Button tapped!")
    }
}
#endif
