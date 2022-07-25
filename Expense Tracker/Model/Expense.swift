//
//  Expense.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 22.07.2022.
//

import Foundation

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
