//
//  IndicatorShape.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 27.07.2022.
//

import SwiftUI

struct IndicatorShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let widht = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: widht / 2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: widht, y: height))
        }
    }
}
    
