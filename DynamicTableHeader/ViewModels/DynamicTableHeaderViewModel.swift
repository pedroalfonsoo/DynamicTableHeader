//
//  DynamicTableHeaderViewModel.swift
//  DynamicTableHeader
//
//  Created by Pedro Alfonso on 3/7/20.
//  Copyright © 2020 Pedro Alfonso. All rights reserved.
//

import Foundation
import UIKit

struct CellViewModel {
    let cityNameLabel: String
}

struct DynamicHeaderTableViewModel {
    let cityNames: [String]
    
    init() {
        cityNames = ["New York", "D.F.", "Barcelona", "Rome", "Prague", "Las Vegas", "Chicago", "Austin", "Dallas",
            "Denver", "Puerto La Cruz", "Milano", "Madrid", "Caracas", "Valencia", "Puerto Ordaz",
            "San Francisco", "Los Angeles", "Margarita", "Bogota", "Barinas"].sorted()
    }
    
    func getCellViewModel(indexPath: IndexPath) -> CellViewModel {
        return CellViewModel(cityNameLabel: cityNames[indexPath.row])
    }
}
