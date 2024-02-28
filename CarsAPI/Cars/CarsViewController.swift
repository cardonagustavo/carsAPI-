//
//  CarsViewController.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.
//

import UIKit

class CarsViewController: UIViewController {
    
    private var carsView: CarsView? { self.view as? CarsView }
    
    private lazy var webSerice = CarsWebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carsView?.delegate = self
        self.carsView?.setupAdapters()
        self.getAll()
        }
        
       private func getAll() {
            self.webSerice.fetch { arrayCarsDTO in
                self.carsView?.reloadData(arrayCarsDTO.toCars)
            }
        }
    }


extension CarsViewController: CarsViewDelegate {
    func carsView(_ carsView: CarsView, didSelectCar car: Car) {
        //TODO: - Navigate to detail of selected car    
    }
}

//Compositional layout
