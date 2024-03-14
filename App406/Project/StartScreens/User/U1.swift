//
//  U1.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Financial progress")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                
                Text("Raise your earnings now")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                        .frame(width: 30, height: 9)
                    
                    Circle()
                        .fill(.gray)
                        .frame(width: 8, height: 8)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 160, height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
