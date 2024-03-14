//
//  AddExpenses.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct AddExpenses: View {

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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.exName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.exName)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter expense category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.exCategory.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.exCategory)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount expense")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.exAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.exAmount)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    .padding(.bottom)

                    Button(action: {
                        
                        viewModel.addExpense()
                        
                        viewModel.exName = ""
                        viewModel.exCategory = ""
                        viewModel.exAmount = ""
                        
                        viewModel.fetchExpenses()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCurr = true
                        }
                                
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    })
                    .disabled(viewModel.exName.isEmpty || viewModel.exCategory.isEmpty || viewModel.exAmount.isEmpty ? true : false)
                    .opacity(viewModel.exName.isEmpty || viewModel.exCategory.isEmpty || viewModel.exAmount.isEmpty ? 0.5 : 1)
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CUrr(viewModel: viewModel)
        })
    }
}

#Preview {
    AddExpenses(viewModel: CarExpensesViewModel())
}
