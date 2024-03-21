//
//  Join.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Join and earn")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading)
                
                Text("Join our Telegram group trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.leading)
                
                HStack {

                    Spacer()
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 160, height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                    })
                }
                .padding()
            }
            
            VStack {
                
                NavigationLink(destination: {
                    
                    Not()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .regular))
                        .padding(5)
                        .background(Circle().fill(.black))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
