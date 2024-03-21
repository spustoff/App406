//
//  Not.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading)
                
                Text("Don’t miss the most useful information")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.leading)
                
                HStack {

                    Spacer()
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable notification")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .semibold))
                            .frame(width: 160, height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color(red: 31/255, green: 107/255, blue: 255/255)))
                    })
                }
                .padding()
            }
            
            VStack {
                
                Button(action: {
                    
                    status = true

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
    Not()
}
