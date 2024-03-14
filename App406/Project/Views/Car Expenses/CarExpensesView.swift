//
//  CarExpensesView.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct CarExpensesView: View {
    
    @StateObject var viewModel = CarExpensesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Car expenses")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.currentCurrency.isEmpty {
                    
                    HStack {
                        
                        Image("flag")
                        
                        Text("EUR/USD")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            ChartView(viewModel: viewModel)
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    
                } else {
                    
                    HStack {
                        
                        Image(viewModel.currentCurrency)
                        
                        Text(viewModel.currentCurrency)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCurr = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    
                }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "car.side.and.exclamationmark.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Service")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("$\(viewModel.service)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "car.side.front.open.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Repair")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("$\(viewModel.repair)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 5) {
                            
                            Image(systemName: "menucard.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Fines")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("$\(viewModel.fines)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGeneral = true
                        }
                        
                    }, label: {
                        
                        Text("Add general expenses")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.5)))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                
                HStack {
                    
                    Text("Expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddExpense = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    })
                }
                .padding(.vertical)
                
                if viewModel.expenses.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("littleCar")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Fill out your car expenses")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 170)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.expenses, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text(index.exName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text(index.exCategory ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text(index.exAmount ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    Rectangle()
                                        .fill(.gray.opacity(0.5))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchExpenses()
        }
        .sheet(isPresented: $viewModel.isAddExpense, content: {
            
            AddExpenses(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CUrr(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddGeneral, content: {
            
            GeneralExpenses(viewModel: viewModel)
        })
    }
}

#Preview {
    CarExpensesView()
}
