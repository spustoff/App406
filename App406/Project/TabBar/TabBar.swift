//
//  TabBar.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? .white : .gray)
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? .white : .gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color.black)
    }
}

enum Tab: String, CaseIterable {
    
    case Cars = "Cars"
    
    case Car_Expenses = "Car Expenses"
    
    case Settings = "Settings"
    
}

#Preview {
   
    ContentView()
}
