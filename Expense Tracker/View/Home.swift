//
//  Home.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 22.07.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 15) {
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.gray.opacity(0.4), lineWidth: 1)
                        )
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .rotationEffect(.degrees(-90))
                }


            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
//            MARK: Custom Gradient Card
            VStack {
                Text("Saved this mount")
                    .foregroundColor(.white.opacity(0.7))
                    .fontWeight(.semibold)
                
                Text("$1299.00")
                    .font(.system(size: 35, weight: .black))
                    .foregroundColor(Color("Green"))
                    .padding(.top, 5)
                    .lineLimit(1)
                
//                MARK: SpeedoMeter
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 340)
//            MARK: Custom Background
            .background(
                RoundedRectangle(cornerRadius: 45, style: .continuous)
                    .fill(
                        .linearGradient(colors: [
                            Color("LightGreen").opacity(0.4),
                            Color("LightGreen").opacity(0.2),
                            Color("LightGreen").opacity(0.1)
                        ] + Array(repeating: Color.clear, count: 5),
                                        startPoint: .topTrailing,
                                        endPoint: .bottomLeading)
                    )
            )
            .padding(.top, 15)
            .padding(.horizontal, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 15)
        .background(
            Color("BG"))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        Home()
    }
}
