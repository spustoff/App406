//
//  ChartView.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct ChartView: View {

    @StateObject var viewModel: CarExpensesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
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
                .padding()
                
                HStack {
                    
                    HStack {
                        
                        Text(viewModel.currentCurrency)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                            .foregroundColor(.green)
                            .font(.system(size: 11, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 0...2))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                }
                .padding()
                
                Image("Chart")
                    .resizable()
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                                                        
                            viewModel.isChart = false
                            viewModel.isCurr = false
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.green))
                        })
                        .padding(.leading)
                        
                        Button(action: {
                                                        
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        .padding(.trailing)
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    ChartView(viewModel: CarExpensesViewModel())
}
