//
//  HomeInteractor.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/27/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import Foundation

class HomeInteractor {
        
    func fetchBudgetData() -> UserBudgetData? {
        guard let path = Bundle.main.path(forResource: "Budget", ofType: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let userBudgetData: UserBudgetData = try decoder.decode(UserBudgetData.self, from: data)
            return userBudgetData
        } catch {
            print("Error: Unable to decode json")
            return nil
        }
    }
}
