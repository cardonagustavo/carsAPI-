//
//  AppNAvigationController.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 29/02/24.
//

import UIKit

class AppNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewControllers = [CarsViewController.buildGrill()]
        self.viewControllers = [CarsViewController.buildSimple()]
    }
    /*
     super.viewDidLoad(): Llama al método viewDidLoad() de la
     clase base (UINavigationController) para realizar cualquier
     configuración necesaria por defecto.

     self.viewControllers = [CarsViewController.buildGrill()]:
     Establece la propiedad viewControllers del
     UINavigationController con un arreglo que contiene una
     instancia de CarsViewController configurada para mostrar una
     vista de lista de automóviles en forma de parrilla (grill).
     Esto significa que cuando se presente este
     UINavigationController, mostrará la vista de lista de
     automóviles en forma de parrilla como la primera vista en la
     pila de controladores de vista.

     self.viewControllers = [CarsViewController.buildSimple()]:
     Esta línea está comentada, pero proporciona una alternativa
     para establecer la propiedad viewControllers del
     UINavigationController con una instancia de
     CarsViewController configurada para mostrar una vista de
     lista de automóviles de forma simple. Si descomentas esta
     línea y comentas la línea anterior, se mostrará la vista de
     lista de automóviles en forma simple como la primera vista
     en la pila de controladores de vista.
     */
}
