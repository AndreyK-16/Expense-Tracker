//
//  SpeedoMeter.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 25.07.2022.
//

import SwiftUI

struct SpeedoMeter: View {
    @Binding var progress: CGFloat
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
//                To Construct Speedometer Shape
//                Simply Iterate Capsule Shape to 180 deg
                ForEach(1...60, id: \.self) { index in
//                    MARK: 60*3 = 180
                    let deg = CGFloat(index) * 3
                    
                    Capsule()
                        .fill(.gray.opacity(0.25))
                        .frame(width: 40, height: 4)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                }
            }
            .frame(width: size.width, height: size.height, alignment: .bottom)
            
            ZStack {
//                To Construct Speedometer Shape
//                Simply Iterate Capsule Shape to 180 deg
                ForEach(1...60, id: \.self) { index in
//                    MARK: 60*3 = 180
                    let deg = CGFloat(index) * 3
                    
                    Capsule()
                        .fill(deg < 60 ? Color("Ring1"): deg >= 60 && deg < 120 ? Color("Ring2") : Color("Ring3"))
                        .frame(width: 40, height: 4)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                }
            }
            .frame(width: size.width, height: size.height, alignment: .bottom)
            
//            MARK: Masking for Upgrating progress and animation
            .mask {
                Circle()
                    .trim(from: 0, to: (progress / 2) + 0.002)
                    .stroke(.white, lineWidth: 40)
                    .frame(width: size.width - 40, height: size.width - 40)
                    .offset(y: -(size.height / 2))
                    .rotationEffect(.degrees(180))
            }
        }
        .overlay(alignment: .bottom, content: {
            HStack {
                Text("0%")
                    .font(.system(size: 15, weight: .semibold))
                
                Spacer()
                
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 15, weight: .semibold))
            }
            .offset(y: 35)
        })
        .overlay(alignment: .bottom, content: {
//            MARK: Custom Indicator shape
        })
        .padding(.top)
        .padding(10)
    }
}

struct SpeedoMeter_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





