//
//  ZagruzkaView.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI


struct ZagruzkaView: View {
    @State var loadingFinished: Bool = false
    @State var goToMenu: Bool = false
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            NavigationLink("", destination: MenuView(), isActive: $goToMenu)
            VStack {
                TriDtext(text: "LOADING", width: 2, color: Color.init(hex: "#12102C"))
                    .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC7CEC"), Color.init(hex: "#4F2697")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .font(.custom(Font.concert, size: 40))
            }
            
            VStack {
                Spacer()
                
                loadingView()
            }
            .padding()
        }
        .onAppear() {
            withAnimation(Animation.linear(duration: 2)) {
                loadingFinished = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                goToMenu = true
            }
        }
    }
    
    func loadingView() -> some View {
        Image("loadingRect")
            .overlay(alignment: .leading) {
                RoundedRectangle(cornerRadius: 100)
                    .fill(LinearGradient(colors: [Color.init(hex: "#EC7CEC"), Color.init(hex: "#4F2697")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 269 * (loadingFinished ? 1 : 0))
            }
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
