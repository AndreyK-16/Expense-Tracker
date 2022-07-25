//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 22.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
