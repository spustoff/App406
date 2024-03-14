//
//  GeneralExpenses.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct GeneralExpenses: View {
 
    @StateObject var viewModel: CarExpensesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("General expenses")
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
                        
                        Text("Enter amount service")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addServise.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addServise)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount repair")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addRepair.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addRepair)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount fines")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addFines.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addFines)
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
                        
                        viewModel.service = viewModel.addServise
                        viewModel.repair = viewModel.addRepair
                        viewModel.fines = viewModel.addFines
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    })
                    .disabled(viewModel.addServise.isEmpty || viewModel.addRepair.isEmpty || viewModel.addFines.isEmpty ? true : false)
                    .opacity(viewModel.addServise.isEmpty || viewModel.addRepair.isEmpty || viewModel.addFines.isEmpty ? 0.5 : 1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GeneralExpenses(viewModel: CarExpensesViewModel())
}
