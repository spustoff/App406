//
//  CarsViewModel.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI
import CoreData

final class CarsViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""

    @Published var colors: [String] = ["Gray", "Blue", "Red", "Black", "White", "Purple"]
    @Published var currentCarColor = ""
    @Published var currentDreamColor = ""
    
    @Published var ACat: String = ""
    
    @Published var carModel: String = ""
    @Published var carCharacteristic: String = ""
    @Published var carMileage: String = ""
    @Published var carColor: String = ""
    
    @Published var isAddCar: Bool = false
    @Published var isDeleteCar: Bool = false
    @Published var isDeleteDream: Bool = false
    @Published var isDetail: Bool = false
    @Published var isAddDream: Bool = false
    @Published var isChart: Bool = false

    @Published var cars: [CarsModel] = []
    @Published var selectedCar: CarsModel?

    func addCar() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CarsModel", into: context) as! CarsModel

        loan.carModel = carModel
        loan.carCharacteristic = carCharacteristic
        loan.carMileage = carMileage
        loan.carColor = carColor

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCars() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarsModel>(entityName: "CarsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.cars = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.cars = []
        }
    }
    
    @Published var dreamModel: String = ""
    @Published var dreamCharacteristic: String = ""
    @Published var dreamColor: String = ""

    @Published var dreams: [DreamModel] = []
    @Published var selectedDream: DreamModel?

    func addDream() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DreamModel", into: context) as! DreamModel

        loan.dreamModel = dreamModel
        loan.dreamCharacteristic = dreamCharacteristic
        loan.dreamColor = dreamColor

        CoreDataStack.shared.saveContext()
    }
    
    func fetchDreams() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DreamModel>(entityName: "DreamModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.dreams = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.dreams = []
        }
    }
}
