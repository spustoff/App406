//
//  AddDream.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct AddDream: View {
    
    @StateObject var viewModel: CarsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New my car")
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
                        
                        Text("Enter car model")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.dreamModel.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.dreamModel)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter characteristics of car")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.dreamCharacteristic.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.dreamCharacteristic)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    Text("Color of car")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.colors, id: \.self) { index in
                          
                            Button(action: {
                                
                                viewModel.currentDreamColor = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentDreamColor.isEmpty {
                            
                            HStack {
                                
                                Text("Select color")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.currentDreamColor)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                        }
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    .padding(.bottom)
                    
                    Button(action: {
                        
                        viewModel.dreamColor = viewModel.currentDreamColor
                        
                        viewModel.addDream()
                        
                        viewModel.dreamModel = ""
                        viewModel.dreamCharacteristic = ""
                        viewModel.currentDreamColor = ""
                        
                        viewModel.fetchDreams()
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    })
                    .disabled(viewModel.currentDreamColor.isEmpty || viewModel.dreamModel.isEmpty || viewModel.dreamCharacteristic.isEmpty ? true : false)
                    .opacity(viewModel.currentDreamColor.isEmpty || viewModel.dreamModel.isEmpty || viewModel.dreamCharacteristic.isEmpty ? 0.5 : 1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddDream(viewModel: CarsViewModel())
}
