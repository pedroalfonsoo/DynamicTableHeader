//
//  ViewController.swift
//  DynamicTableHeader
//
//  Created by Pedro Alfonso on 3/6/20.
//  Copyright © 2020 Pedro Alfonso. All rights reserved.
//

import UIKit

class DynamicTableHeaderViewController: UIViewController, UITableViewDelegate {
    private let viewModel = DynamicHeaderTableViewModel()
    lazy private var dynamicHeaderView: DynamicHeaderView = {
        let view_ = DynamicHeaderView()
        view_.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: viewMaxHeight)
        view_.translatesAutoresizingMaskIntoConstraints = false
        
        return view_
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(DynamicTableViewCell.self, forCellReuseIdentifier: DynamicTableViewCell.cellName)
        table.allowsSelection = false
        return table
    }()
    
    private var tableViewTopConstraint: NSLayoutConstraint!
    private let viewMaxHeight: CGFloat = 100
    private var initialOffSet: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        title = "City Search"
          
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(dynamicHeaderView)
        view.addSubview(tableView)
        
        dynamicHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dynamicHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dynamicHeaderView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        dynamicHeaderView.heightAnchor.constraint(equalToConstant: viewMaxHeight).isActive = true
               
        tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewMaxHeight)
        tableViewTopConstraint.isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension DynamicTableHeaderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bounceOffSetAtBottom = scrollView.contentSize.height - scrollView.bounds.height
        
        let finalOffSet = tableView.contentOffset.y
        let offSet = finalOffSet - initialOffSet
           
        if tableViewTopConstraint.constant - offSet < 0 {
            tableViewTopConstraint.constant = 0
            title = "Dynamic Header View"
            dynamicHeaderView.dismissKeyboard()
        } else if tableViewTopConstraint.constant - offSet > viewMaxHeight {
            tableViewTopConstraint.constant = viewMaxHeight
            title = "City Search"
        } else if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < bounceOffSetAtBottom {
             tableViewTopConstraint.constant -= offSet
        }
        
        initialOffSet = finalOffSet
    }
}

extension DynamicTableHeaderViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DynamicTableViewCell.cellName, for: indexPath) as! DynamicTableViewCell
        
        cell.setupWithModel(viewModel.getCellViewModel(indexPath: indexPath))
        return cell
    }
}
