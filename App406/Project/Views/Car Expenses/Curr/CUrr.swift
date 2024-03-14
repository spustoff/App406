//
//  CUrr.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct CUrr: View {

    @StateObject var viewModel: CarExpensesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 25)
                
                HStack {
                    
                    Image(viewModel.currentCurrency)
                    
                    Text(viewModel.currentCurrency)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
       
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                
                Text("Currency pairs")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChart = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                        }
                    })
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    CUrr(viewModel: CarExpensesViewModel())
}
