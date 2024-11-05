//
//  BackButtonView.swift
//  TheLastShot
//
//  Created by Nicolae Chivriga on 05/11/2024.
//

import SwiftUI


struct BackButtonView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("backPurple")
//                 .resizable()
//                 .frame(width: 40, height: 40)
        }
    }
}
