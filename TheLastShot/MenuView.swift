//
//  Untitled.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
           
          
            
            VStack {
                Image("topBar")
                    .overlay {
                        HStack {
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Image("settingsImg")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                  
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                    }
                Spacer()
                NavigationLink {
                    ShotGameView()
                } label: {
                    ButtonTitleView(text: "PLAY")
                }

               
            }
            .edgesIgnoringSafeArea(.top)
            .padding(.bottom)
        }
        .navigationBarBackButtonHidden()
    }
}
