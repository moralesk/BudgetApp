//
//  HomeViewModel.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/28/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    func calculateDebitLimitFrom(bills: [Bill]) -> Double {
        let usableBillAmounts = bills.filter{ $0.deductFromChecking && isDateAfterToday(date: $0.date) }.map{ $0.amount }
        print(usableBillAmounts)
        let limit: Double = usableBillAmounts.reduce(0, +)
        return limit
    }
    
    private func isDateAfterToday(date: Int) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        if let todaysDate = Int(formatter.string(from: Date())) {
            return date > todaysDate
        }
        return false
    }
}
