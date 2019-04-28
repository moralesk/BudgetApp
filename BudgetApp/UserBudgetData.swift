//
//  UserBudgetData.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/27/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import Foundation

struct UserBudgetData: Codable {
    let name: String
    let incomeBiWeekly: Double
    let creditCardLimit: Double
    let checkingLimit: Double
    let bills: [Bill]
}

struct Bill: Codable {
    let date: Int
    let amount: Double
    let purpose: String
    let deductFromChecking: Bool
}
