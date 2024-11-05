//
//  SettingsView.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Button {
                    if let url = URL(string: "mailto:protocastleton@gmail.com") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    ButtonTitleView(text: "CONTACT US")
                }
                
                
                Button {
                    if let url = URL(string: "https://www.dropbox.com/scl/fi/s10fdc3ugui0fn4bh6kms/Privacy-Policy-for-Last-Shot-Ball.paper?rlkey=1l4b23jjx523m9un4e4nnvyrl&st=w6ek263k&dl=0") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ButtonTitleView(text: "PRIVACY")
                }
                
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButtonView())
        .toolbar {
                  ToolbarItem(placement: .principal) {
                      TriDtext(text: "SETTINGS", width: 1, color: Color.init(hex: "#AEADE0").opacity(0.25))
                          .foregroundStyle(Color.init(hex: "#19183C"))
                          .font(.custom(Font.concert, size: 40))
                  }
              }
    }
}

extension Font  {
    static var concert: String = "ConcertOne-Regular"
}
struct TriDtext: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
