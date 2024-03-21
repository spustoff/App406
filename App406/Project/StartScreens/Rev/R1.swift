//
//  R1.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Your cars")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading)
                
                Text("The relevance of your cars is under control")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.leading)
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white)
                        .frame(width: 30, height: 9)
                    
                    Circle()
                        .fill(.gray)
                        .frame(width: 8, height: 8)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
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
    }
}

#Preview {
    R1()
}
