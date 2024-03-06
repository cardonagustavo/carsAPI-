//
//  CarsViewController.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.
//

import UIKit

class CarsViewController: UIViewController {
//    weak var delegate: CarsViewDelegate?
    private var carsView: CarsView //? { self.view as? CarsView }
    
    
    /*
     private var carsView: CarsView //? { self.view as? CarsView
     }: This line declares a variable carsView of type CarsView,
     which seems to be related to a view in the code. The comment
     //? { self.view as? CarsView } suggests that it might be an
     optional variable, initialized by casting self.view
     (presumably a property of the current class) to type
     CarsView. The as? operator is used for conditional type
     casting, returning an optional value of the specified type.
     */
    
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
    /*
     El nibName: se usa pra la construccion por xml
     */
    
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

