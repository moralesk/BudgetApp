//
//  GreetingTableViewCell.swift
//  BudgetApp
//
//  Created by Kelly Morales on 4/27/19.
//  Copyright © 2019 Kelly Morales. All rights reserved.
//

import UIKit

class GreetingTableViewCell: UITableViewCell {
    
    static let reuseID = "GreetingTableViewCell"
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUser(name: String?) {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = false
        let greetingPredicate = name != nil ? ", \(name ?? "")!" : "!"
        greetingLabel.text = "Hello\(greetingPredicate)"
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd"
        dateLabel.text = "Today's date is \(formatter.string(from: date))"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGreetingConstraints()
        setDateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setGreetingConstraints()
        setDateConstraints()
    }
    
    private func setGreetingConstraints() {
        if greetingLabel.superview == nil {
            contentView.addSubview(greetingLabel)
        }
        NSLayoutConstraint.init(item: greetingLabel, attribute: .top, relatedBy: .equal, toItem: greetingLabel.superview, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: greetingLabel, attribute: .left, relatedBy: .equal, toItem: greetingLabel.superview, attribute: .left, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: greetingLabel, attribute: .right, relatedBy: .equal, toItem: greetingLabel.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: greetingLabel, attribute: .bottom, relatedBy: .equal, toItem: greetingLabel.superview, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    private func setDateConstraints() {
        if dateLabel.superview == nil {
            contentView.addSubview(dateLabel)
        }
        NSLayoutConstraint.init(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: dateLabel.superview, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: dateLabel.superview, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: dateLabel, attribute: .right, relatedBy: .equal, toItem: dateLabel.superview, attribute: .right, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint.init(item: dateLabel, attribute: .bottom, relatedBy: .equal, toItem: dateLabel.superview, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
}
