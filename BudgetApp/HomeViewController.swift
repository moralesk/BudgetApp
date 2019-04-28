//
//  HomeViewController.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/27/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeInteractor = HomeInteractor()
    let homeViewModel = HomeViewModel()
    let homeTableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
    var userBudgetData: UserBudgetData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBudgetData = homeInteractor.fetchBudgetData()
        self.view.addSubview(homeTableView)
        homeTableView.dataSource = self
        homeTableView.register(GreetingTableViewCell.self, forCellReuseIdentifier: GreetingTableViewCell.reuseID)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GreetingTableViewCell.reuseID, for: indexPath) as? GreetingTableViewCell else {
                return UITableViewCell()
            }
            cell.setUser(name: userBudgetData?.name)
            return cell
        case 1:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            if let limit = userBudgetData?.creditCardLimit {
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                cell.textLabel?.text = "$" + String(describing: limit)
            }
            return cell
        case 2:
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            if let bills = userBudgetData?.bills {
                cell.textLabel?.textAlignment = .center
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                cell.textLabel?.text = String(format: "$%.2f", homeViewModel.calculateDebitLimitFrom(bills: bills))
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Maximum Credit Card Amount Today"
        case 2:
            return "Minimum Debit Card Amount Today"
        default:
            return nil
        }
    }
}
