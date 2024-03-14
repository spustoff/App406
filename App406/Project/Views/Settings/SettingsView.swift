//
//  SettingsView.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    })

                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 10) {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
