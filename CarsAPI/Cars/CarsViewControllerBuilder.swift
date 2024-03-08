//
//  CarsViewControllerBuilder.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.
//

import Foundation

extension CarsViewController {
    class func buildSimple() -> CarsViewController {
        let  carView = CarsView(listAdapter: ListCarSimpleAdapter(), searchAdapter: SearchCardByInfoAdapter())
        let controller = CarsViewController(carView: carView)
        return controller
    }
    /*
     class func buildSimple() -> CarsViewController {: Este
     método estático devuelve una instancia de CarsViewController
     y está marcado como class func, lo que significa que
     pertenece a la clase en lugar de a una instancia específica
     de la clase.
     
     let carView = CarsView(listAdapter: ListCarSimpleAdapter()):
     Dentro del método, se crea una instancia de CarsView
     utilizando un adaptador de lista llamado
     ListCarSimpleAdapter. Presumiblemente, este adaptador de
     lista es una implementación específica que proporciona datos
     a la vista de lista de automóviles de una manera simple.
     
     let controller = CarsViewController(carView: carView): Se
     crea una instancia de CarsViewController utilizando la
     CarsView recién creada como parámetro. Esto significa que el
     controlador de vista se inicializa con la vista de lista de
     automóviles recién creada.
     
     return controller: El método devuelve la instancia recién
     creada de CarsViewController.
     
     En resumen, este método estático buildSimple() se utiliza
     para crear y configurar una instancia simple de
     CarsViewController con una vista de lista de automóviles
     asociada que utiliza un adaptador de lista específico
     (ListCarSimpleAdapter). Esto proporciona una forma
     conveniente de crear instancias de CarsViewController con
     diferentes configuraciones desde fuera de la clase.
     */
    
    class func buildGrill() -> CarsViewController {
        let  carView = CarsView(listAdapter: ListCardGrillAdapter(), searchAdapter: SearchCardByNameYearAdapter())
        let controller = CarsViewController(carView: carView)
        return controller
    }
    /*
     class func buildGrill() -> CarsViewController {: Este método
     estático devuelve una instancia de CarsViewController y está
     marcado como class func, lo que significa que pertenece a la
     clase en lugar de a una instancia específica de la clase.
     
     let carView = CarsView(listAdapter: ListCardGrillAdapter()):
     Dentro del método, se crea una instancia de CarsView
     utilizando un adaptador de lista llamado
     ListCardGrillAdapter. Presumiblemente, este adaptador de
     lista proporciona datos a la vista de lista de automóviles
     en forma de parrilla (grilla), lo que implica que los
     automóviles se mostrarán en una disposición de parrilla en
     lugar de una lista tradicional.
     
     let controller = CarsViewController(carView: carView): Se
     crea una instancia de CarsViewController utilizando la
     CarsView recién creada como parámetro. Esto significa que el
     controlador de vista se inicializa con la vista de lista de
     automóviles recién creada.
     
     return controller: El método devuelve la instancia recién
     creada de CarsViewController.
     
     En resumen, este método estático buildGrill() se utiliza
     para crear y configurar una instancia de CarsViewController
     con una vista de lista de automóviles asociada que utiliza
     un adaptador de lista específico (ListCardGrillAdapter).
     Esto proporciona una forma conveniente de crear instancias
     de CarsViewController con diferentes configuraciones desde
     fuera de la clase.
     */
}
