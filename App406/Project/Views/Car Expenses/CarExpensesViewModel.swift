//
//  CarExpensesViewModel.swift
//  App406
//
//  Created by IGOR on 13/03/2024.
//

import SwiftUI
import CoreData

final class CarExpensesViewModel: ObservableObject {

    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""

    @AppStorage("service") var service = ""
    @AppStorage("repair") var repair = ""
    @AppStorage("fines") var fines = ""
    
    @Published var addServise = ""
    @Published var addRepair = ""
    @Published var addFines = ""
    
    @Published var exName: String = ""
    @Published var exCategory: String = ""
    @Published var exAmount: String = ""
    
    @Published var isAddExpense: Bool = false
    @Published var isAddGeneral: Bool = false
    @Published var isDeleteExpense: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isCurr: Bool = false

    @Published var expenses: [ExpensesModel] = []
    @Published var selectedExpense: ExpensesModel?

    func addExpense() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExpensesModel", into: context) as! ExpensesModel

        loan.exName = exName
        loan.exCategory = exCategory
        loan.exAmount = exAmount

        CoreDataStack.shared.saveContext()
    }
    
    func fetchExpenses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpensesModel>(entityName: "ExpensesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.expenses = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.expenses = []
        }
    }
}
