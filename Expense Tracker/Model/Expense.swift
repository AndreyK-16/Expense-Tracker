//
//  Expense.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 22.07.2022.
//

import Foundation
import SwiftUI

struct Expense: Identifiable {
    var id = UUID().uuidString
    var icon: String
    var title: String
    var subTitle: String
    var amount: String
}

var expenses: [Expense] = [
    Expense(icon: "fork.knife", title: "Food", subTitle: "K Food Restautant", amount: "$132.00"),
    Expense(icon: "car.fill", title: "Taxi", subTitle: "Taxi Payment", amount: "$32.50"),
    Expense(icon: "gamecontroller.fill", title: "Playstation", subTitle: "Subscriptions", amount: "$22.90")
]

//MARK: Month and sample progress for animating speedometer
let months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
let progressArray: [CGFloat] = [0.1, 0.4, 0.9, 0.5, 0.3, 0.7, 0.89, 0.2, 0.56, 0.23, 0.11, 0.65]
