//
//  ContentView.swift
//  Shared
//
//  Created by Mayank Batra on 08/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    private let weekdays = ["MON", "TUE", "WED", "THU", "FRI"]
    
    private let dayForecast = [
        ForecastItem(day: "MON", icon: "cloud.sun.fill", temp: 76, condition: "Partly Sunny"),
        ForecastItem(day: "TUE", icon: "cloud.rain.fill", temp: 68, condition: "Showers"),
        ForecastItem(day: "WED", icon: "sun.max.fill", temp: 82, condition: "Sunny"),
        ForecastItem(day: "THU", icon: "cloud.bolt.rain.fill", temp: 71, condition: "Thunder"),
        ForecastItem(day: "FRI", icon: "sun.haze.fill", temp: 79, condition: "Hazy Sun")
    ]
    
    private let nightForecast = [
        ForecastItem(day: "MON", icon: "moon.stars.fill", temp: 62, condition: "Clear Night"),
        ForecastItem(day: "TUE", icon: "wind", temp: 58, condition: "Breezy"),
        ForecastItem(day: "WED", icon: "cloud.moon.fill", temp: 60, condition: "Partly Cloudy"),
        ForecastItem(day: "THU", icon: "cloud.moon.bolt.fill", temp: 59, condition: "Night Storm"),
        ForecastItem(day: "FRI", icon: "moon.dust.fill", temp: 64, condition: "Dust Mist")
    ]
    
    var currentForecast: [ForecastItem] {
        isNight ? nightForecast : dayForecast
    }
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack(spacing: 16) {
                // Location Header
                VStack(spacing: 4) {
                    Text("Cupertino, CA")
                        .font(.system(size: 34, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text(isNight ? "Clear Night · Light Breeze" : "Scattered Clouds · Humid")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.top, 24)
                
                Spacer()
                
                // Hero Weather Icon & Temp
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170)
                        .shadow(color: isNight ? .indigo.opacity(0.35) : .orange.opacity(0.35), radius: 18, y: 8)
                        .symbolRenderingMode(.multicolor)
                    
                    Text(isNight ? "62°" : "76°")
                        .font(.system(size: 72, weight: .medium, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text("H: 78°  L: 59°")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.75))
                }
                
                // Atmospheric Micro-Metrics Card
                HStack(spacing: 24) {
                    MetricPill(title: "HUMIDITY", value: isNight ? "74%" : "62%", icon: "humidity.fill")
                    MetricPill(title: "WIND", value: isNight ? "6 mph" : "9 mph", icon: "wind")
                    MetricPill(title: "UV INDEX", value: isNight ? "0" : "5", icon: "sun.max.trianglebadge.exclamationmark.fill")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(.ultraThinMaterial.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(.white.opacity(0.15), lineWidth: 1)
                )
                .padding(.horizontal, 24)
                
                Spacer()
                
                // 5-Day Forecast Row
                HStack(spacing: 12) {
                    ForEach(currentForecast) { item in
                        WeatherDayView(item: item)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(.ultraThinMaterial.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(.white.opacity(0.12), lineWidth: 1)
                )
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Interactive Day/Night Toggle Button
                Button {
                    withAnimation(.spring(response: 0.45, dampingFraction: 0.7)) {
                        isNight.toggle()
                    }
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: isNight ? "sun.max.fill" : "moon.stars.fill")
                            .foregroundStyle(isNight ? .orange : .indigo)
                        Text(isNight ? "Switch to Day" : "Switch to Night")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundStyle(isNight ? Color(white: 0.1) : .blue)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(.white)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.18), radius: 10, y: 4)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 24)
            }
        }
    }
}

struct ForecastItem: Identifiable {
    let id = UUID()
    let day: String
    let icon: String
    let temp: Int
    let condition: String
}

struct WeatherDayView: View {
    let item: ForecastItem
    
    var body: some View {
        VStack(spacing: 8) {
            Text(item.day)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            Image(systemName: item.icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            
            Text("\(item.temp)°")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MetricPill: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 11))
                Text(title)
                    .font(.system(size: 10, weight: .semibold, design: .rounded))
            }
            .foregroundStyle(.white.opacity(0.7))
            
            Text(value)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: isNight
                ? [Color(red: 0.05, green: 0.07, blue: 0.16), Color(red: 0.12, green: 0.15, blue: 0.32)]
                : [Color(red: 0.12, green: 0.47, blue: 0.88), Color(red: 0.42, green: 0.72, blue: 0.94), Color.white.opacity(0.85)],
            startPoint: .top,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        .animation(.easeInOut(duration: 0.5), value: isNight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
