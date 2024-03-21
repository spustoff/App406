//
//  Reviews.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading)
                
                Text("Help make the app even better")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.leading)
                
                HStack {
                    
                    Circle()
                        .fill(.gray)
                        .frame(width: 8, height: 8)
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                        .frame(width: 30, height: 9)
   
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(width: 160, height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color(red: 31/255, green: 107/255, blue: 255/255)))
                    })
                }
                .padding()
            }
        }
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}
