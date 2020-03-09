//
//  DynamicTableViewCell.swift
//  DynamicTableHeader
//
//  Created by Pedro Alfonso on 3/7/20.
//  Copyright © 2020 Pedro Alfonso. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {
    static let cellName = String(describing: DynamicTableViewCell.self)
    let cityNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cityNameLabel)
        
        cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        cityNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWithModel(_ viewModel: CellViewModel) {
        cityNameLabel.text = viewModel.cityNameLabel
    }
}
