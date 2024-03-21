//
//  LoadingView.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
