//
//  CarsViewController.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.
//

import UIKit

class CarsViewController: UIViewController {
    
    private var carsView: CarsView //? { self.view as? CarsView }
    private lazy var webSerice = CarsWebService()  //podemos inyectarlo en la inicializacion de la contruccion.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.carsView
        self.carsView.delegate = self
        self.carsView.setupAdapters()
        self.getAll()
        }
        
       private func getAll() {
            self.webSerice.fetch { arrayCarsDTO in
                self.carsView.reloadData(arrayCarsDTO.toCars)
            }
        }
    
    init(carView: CarsView) {
        self.carsView = carView
        super.init(nibName:  nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CarsViewController: CarsViewDelegate {
    func carsView(_ carsView: CarsView, didSelectCar car: Car) {
        //TODO: - Navigate to detail of selected car    
    }
}

//Compositional layout

extension CarsViewController {
    class func build() -> CarsViewController {
        let  carView = CarsView(listAdapter: ListCarAdapter())
        let controller = CarsViewController(carView: carView)
        return controller
    }
}
