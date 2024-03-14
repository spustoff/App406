//
//  AddCar.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct AddCar: View {
    
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
                            .opacity(viewModel.carModel.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.carModel)
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
                            .opacity(viewModel.carCharacteristic.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.carCharacteristic)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                    .padding(1)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter mileage")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.carMileage.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.carMileage)
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
                                
                                viewModel.currentCarColor = index
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentCarColor.isEmpty {
                            
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
                                
                                Text(viewModel.currentCarColor)
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
                        
                        viewModel.carColor = viewModel.currentCarColor
                        
                        viewModel.addCar()
                        
                        viewModel.carModel = ""
                        viewModel.carCharacteristic = ""
                        viewModel.carMileage = ""
                        viewModel.currentCarColor = ""
                        
                        viewModel.fetchCars()
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(.gray.opacity(0.5)))
                    })
                    .disabled(viewModel.currentCarColor.isEmpty || viewModel.carModel.isEmpty || viewModel.carCharacteristic.isEmpty || viewModel.carMileage.isEmpty ? true : false)
                    .opacity(viewModel.currentCarColor.isEmpty || viewModel.carModel.isEmpty || viewModel.carCharacteristic.isEmpty || viewModel.carMileage.isEmpty ? 0.5 : 1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCar(viewModel: CarsViewModel())
}
