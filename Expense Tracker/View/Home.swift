//
//  Home.swift
//  Expense Tracker
//
//  Created by Andrey Kaldyaev on 22.07.2022.
//

import SwiftUI

struct Home: View {
    
    @State var progress: CGFloat = 0.5
//    MARL: Current month
    @State var currentMonth: String = "Jul"
    @Namespace var animation
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
                
                AnimatedNumberText(value: progress * 1299, font: .system(size: 35, weight: .black), isCurrency: true)
                
                    .foregroundColor(Color("Green"))
                    .padding(.top, 5)
                    .lineLimit(1)
                
//                MARK: SpeedoMeter
                SpeedoMeter(progress: $progress)
                
            }
            .padding(.top, 50)
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
                        ] + Array(repeating: Color.clear, count: 4),
                                        startPoint: .topTrailing,
                                        endPoint: .bottomLeading)
                    )
            )
            .padding(.top, 15)
            .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
//                            MARK: Months ScrollView
                            ForEach(months, id: \.self) { month in
                                Text(month)
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 15)
                                    .background{
                                        if currentMonth == month {
                                            Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "MONTH", in: animation)
                                        }
                                    }
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0)) {
                                            currentMonth = month
                                            progress = progressArray[getIndex(month: month)]
                                        }
                                        
                                    }
                            }
                        }
                    }

                    BottomContent()
                        .padding(.top)
                }
                .padding()
            }
            .padding(.top, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 15)
        .background(
            Color("BG"))

    }
    
//    MARK: Bottom Content
    @ViewBuilder
    func BottomContent()->some View {
        VStack(spacing: 15) {
            ForEach(expenses) {expence in
                HStack(spacing: 12) {
                    Image(systemName: expence.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(expence.title)
                            .fontWeight(.bold)
                        
                        Text(expence.subTitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(expence.amount)
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .padding()
            }
        }
    }
    
//    MARK: Retreiving Index
    func getIndex(month: String) -> Int {
        return months.firstIndex { value in
            return month == value
        } ?? 0
    }
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        Home()
    }
}
