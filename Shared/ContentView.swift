//
//  ContentView.swift
//  Shared
//
//  Created by Mayank Batra on 08/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    private var Weekdays = [
        "MON","TUE","WED","THU","FRI","SAT","SUN"
    ]
    private var weatherConditionDay = ["cloud.sun.fill","cloud.rain.fill","cloud.snow.fill","sun.max.fill","cloud.fog.fill"]
    
    private var weatherConditionNight = ["moon.stars.fill","wind","cloud.snow.fill","cloud.moon.bolt.fill","cloud.bolt.rain.fill"]
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: $isNight
               )

            VStack {
                Text("Cupertino, CA")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top,20)
                
                Image(systemName: isNight ? weatherConditionNight[0] : weatherConditionDay[0])
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 200, alignment: .center)
                    .padding(.bottom,20)
                
                Text("76°")
                    .foregroundColor(.white)
                    .font(.system(size: 48,weight: .medium))
                    .padding(.bottom,20)
                    
                
                HStack(spacing:20){
                    
                    WeatherView(
                        weatherType: isNight ? weatherConditionNight[1] : weatherConditionDay[1],
                        temperature: 76,
                        dayName: Weekdays[0])
                    
                    WeatherView(
                        weatherType: isNight ? weatherConditionNight[2] : weatherConditionDay[2],
                        temperature: 56,
                        dayName: Weekdays[1])
                    
                    WeatherView(
                        weatherType: isNight ? weatherConditionNight[3] : weatherConditionDay[3],
                        temperature: 26,
                        dayName: Weekdays[2])
                    
                    WeatherView(
                        weatherType: isNight ? weatherConditionNight[4] : weatherConditionDay[4],
                        temperature: 76,
                        dayName: Weekdays[3])
                    
                    WeatherView(
                        weatherType: isNight ? weatherConditionNight[0] : weatherConditionDay[0],
                        temperature: 86,
                        dayName: Weekdays[4])
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .bold()
                        .foregroundColor(.blue)
                        .font(.system(size: 24,weight: .medium,design: .default))
            
                }.padding()
                .background(.white)
                .cornerRadius(10)
                
                
                Spacer()
         
            }
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.device)
                .previewDevice("iPhone 13 Pro")
        }
    }
}

struct WeatherView: View {
    var weatherType: String
    var temperature: Int
    var dayName: String
    var body: some View {
        VStack{
            Text(dayName).font(.system(size: 20,weight: .bold)).foregroundColor(.white)
            Image(systemName: weatherType)
                .resizable()
                .renderingMode(.original).aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .center)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28,weight: .bold))
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,.white], startPoint: UnitPoint.top, endPoint: UnitPoint.bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}
