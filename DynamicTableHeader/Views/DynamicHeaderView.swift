//
//  DynamicHeaderView.swift
//  DynamicTableHeader
//
//  Created by Pedro Alfonso on 3/7/20.
//  Copyright © 2020 Pedro Alfonso. All rights reserved.
//

import UIKit

class DynamicHeaderView: UIView {
    let searchBar: UISearchBar = {
        let sb = UISearchBar(frame: .zero)
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.searchTextField.frame.size.height = 100
        sb.barTintColor = .black
        sb.showsCancelButton = true
        
        return sb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dismissKeyboard() {
        searchBar.resignFirstResponder()
    }
    
    private func setupView() {
        addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
