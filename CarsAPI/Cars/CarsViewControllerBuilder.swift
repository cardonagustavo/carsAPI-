//
//  CarsViewControllerBuilder.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.
//

import Foundation

extension CarsViewController {
    class func buildSimple() -> CarsViewController {
        let  carView = CarsView(listAdapter: ListCarSimpleAdapter())
        let controller = CarsViewController(carView: carView)
        return controller
    }
    
    class func buildGrill() -> CarsViewController {
        let  carView = CarsView(listAdapter: ListCardGrillAdapter())
        let controller = CarsViewController(carView: carView)
        return controller
    }
}
