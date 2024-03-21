//
//  R2.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading, spacing: 15) {
                
                Spacer()
                
                Text("Record your car expenses")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .padding(.leading)
                
                Text("All expenses are taken into account")
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
                    
                    Button(action: {
                        
                      status = true
                        
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
    R2()
}
