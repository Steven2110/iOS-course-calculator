//
//  SwiftUIView.swift
//  Calculator
//
//  Created by Steven Wijaya on 12.02.2022.
//

import SwiftUI

struct DisplayView: View {
    static let gradientStart = Color(red: 0.792, green: 0.831, blue: 0.773, opacity: 1)
    static let gradientEnd = Color(red: 0.699, green: 0.749, blue: 0.647, opacity: 1)
    
    private let displayWidth: CGFloat = UIScreen.main.bounds.width - (2 * 24)
    
    @EnvironmentObject var result : CalculationModel
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                      gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                      startPoint: .init(x: 0.25, y: 0.5),
                      endPoint: .init(x: 0.75, y: 0.5)
                    ))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, x: 0, y: 0)
                .frame(width: displayWidth, height: 100)
            ZStack(alignment: .leading) {
                Text(getShadowDisplay(isDecimal: result.isDecimal, decimalVal: result.value))
                    .font(Font.custom("digitalnumbers-regular", size: 40))
                    .foregroundColor(Color(red: 0.216, green: 0.227, blue: 0.216, opacity: 0.17))
                Text(result.value)
                    .font(Font.custom("digitalnumbers-regular", size: 40))
                    .foregroundColor(Color(red: 0.216, green: 0.227, blue: 0.216))
            }
        }
    }
    
    private func getShadowDisplay (isDecimal: Bool, decimalVal: String) -> String {
        if isDecimal {
            let decArr = decimalVal.components(separatedBy: ".")
            let index = decArr[0].count
            var displayText = "8888888888"
            displayText.insert(".", at: displayText.index(displayText.startIndex, offsetBy: index))
            return displayText
        } else {
            return "8888888888"
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
            .environmentObject(CalculationModel())
    }
}
