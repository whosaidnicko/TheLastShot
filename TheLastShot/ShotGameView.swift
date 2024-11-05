//
//  ShotGameView.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//


import SwiftUI

struct ShotGameView: View {
    @Environment(\.dismiss) var dismiss
    @State var loadingFinished: Bool = false
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/the-last-shot/")!, onLoadCompletion: {
                loadingFinished = true
            })
            
            TriDtext(text: "LOADING...", width: 2, color: Color.init(hex: "#12102C"))
                .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC7CEC"), Color.init(hex: "#4F2697")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .font(.custom(Font.concert, size: 40))
                .opacity(loadingFinished ? 0 : 1)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            TriDtext(text: "MENU", width: 2, color: Color.init(hex: "#12102C"))
                .foregroundStyle(LinearGradient(colors: [Color.init(hex: "#EC7CEC"), Color.init(hex: "#4F2697")], startPoint: .topLeading, endPoint: .bottomTrailing))
                .font(.custom(Font.concert, size: 30))
        })
                                )
    }
}
