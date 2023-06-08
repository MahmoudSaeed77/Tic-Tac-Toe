//
//  WeatherView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 06/06/2023.
//

import SwiftUI

struct WeatherView: View {
    
    @State var isNight: Bool = false
    
    var body: some View {
        ZStack {
            GrediantView(isNight: $isNight)
            ScrollView {
                VStack {
                    Text("Cairo, EG")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.white)
                    VStack {
                        Image(systemName: "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 180)
                        Text("40°")
                            .font(.system(size: 50, weight: .medium))
                            .foregroundColor(.white)
                    }.padding(.bottom, 40)
                    HStack(alignment: .center, spacing: 8) {
                        WeatherDayView(dayOfWeak: "SAT", imageName: "sun.max.fill", degree: 40)
                        WeatherDayView(dayOfWeak: "SUN", imageName: "cloud.sun.fill", degree: 35)
                        WeatherDayView(dayOfWeak: "MON", imageName: "sunset.fill", degree: 37)
                        WeatherDayView(dayOfWeak: "TUE", imageName: "sun.dust.fill", degree: 32)
                        WeatherDayView(dayOfWeak: "WED", imageName: "cloud.sun.fill", degree: 41)
                        WeatherDayView(dayOfWeak: "THU", imageName: "sun.haze.fill", degree: 45)
                        WeatherDayView(dayOfWeak: "FRI", imageName: "sun.max.fill", degree: 42)
                    }.padding(.bottom, 40)
                    
                    
                    Button(action: {
                        isNight.toggle()
                    }, label: {
                        Text("Change Day Time")
                            .frame(width: 280, height: 55)
                            .background(Color.white)
                            .font(.system(size: 30, weight: .bold))
                            .cornerRadius(10)
                            .foregroundColor(.blue)
                    })
                    
                }.padding(.all, 40)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeak: String
    var imageName: String
    var degree: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Text(dayOfWeak)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(degree)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct GrediantView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(edges: .all)
    }
    
}
