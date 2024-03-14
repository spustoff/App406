//
//  CarsView.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI

struct CarsView: View {
    
    @StateObject var viewModel = CarsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Cars")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.cars.isEmpty {
                        
                        VStack {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Text("My cars")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text("Add your car to track its characteristics")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                                
                                Spacer()
                                
                                Image("emptyCar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                            }
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCar = true
                                }
                                
                            }, label: {
                                
                                Text("Add my car")
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
                        .padding(.bottom)
                        
                    } else {
                        
                        LazyVStack {
                            
                            HStack {
                                
                                Text("My cars")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddCar = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                })
                            }
                            
                            ForEach(viewModel.cars, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Text(index.carModel ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text(index.carCharacteristic ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text(index.carMileage ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(index.carColor ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 130)
                                    
                                    Spacer()
                                    
                                    Menu(content: {
                                                                                
                                        Button(action: {
                                            
                                            viewModel.selectedCar = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteCar = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Delete")
                                    
                                        })
                                        
                                    }, label: {
                                        
                                        Text("...")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                    })
                                }
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .padding(.bottom, 9)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.2)))
                    }
                    
                    if viewModel.dreams.isEmpty {
                        
                        VStack {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Text("Dream Car")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                    
                                    Text("Seize the right moment to make your dream come true")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                }
                                
                                Spacer()
                                
                                Image("emptyCar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                            }
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddDream = true
                                }
                                
                            }, label: {
                                
                                Text("Add dream")
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
                        
                    } else {
                        
                        LazyVStack {
                            
                            HStack {
                                
                                Text("Dream Car")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddDream = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                })
                            }
                            
                            ForEach(viewModel.dreams, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 12) {
                                        
                                        Text(index.dreamModel ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        Text(index.dreamCharacteristic ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Image(index.dreamColor ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 130)
                                    
                                    Spacer()
                                    
                                    Menu(content: {
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedDream = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDeleteDream = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text("Delete")
                                    
                                        })
                                        
                                    }, label: {
                                        
                                        Text("...")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                    })
                                }
                                
                                Rectangle()
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
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
            
            viewModel.fetchCars()
        }
        .onAppear {
            
            viewModel.fetchDreams()
        }
        .sheet(isPresented: $viewModel.isAddCar, content: {
            
            AddCar(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddDream, content: {
            
            AddDream(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteCar ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteCar = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteCar = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete this car?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteCar(withCarModel: viewModel.selectedCar?.carModel ?? "", completion: {
                            
                            viewModel.fetchCars()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteCar = true
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteCar = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDeleteCar ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteDream ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteDream = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteDream = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete this car?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteDream(withDreamModel: viewModel.selectedDream?.dreamModel ?? "", completion: {
                            
                            viewModel.fetchDreams()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteDream = false
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteDream = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDeleteDream ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CarsView()
}
