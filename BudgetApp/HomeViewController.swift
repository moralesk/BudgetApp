//
//  HomeViewController.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/27/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeTableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        self.view.addSubview(homeTableView)
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
