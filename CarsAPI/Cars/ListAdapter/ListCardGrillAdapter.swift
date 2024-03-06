//  ListCardGrillAdapter.swift
//  CarsAPI
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.

import UIKit

class ListCardGrillAdapter: NSObject, ListCarAdapterProtocol {
    
    private unowned var collectionView: UICollectionView?
    private var didSelect: ((_ car: Car) -> Void)?
    
    var datasource = [Car]()
    
    func setCollectionView(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.setCarsLayout()
        self.collectionView?.register(UINib(nibName: "CarsCollectionViewCellRow", bundle: .main), forCellWithReuseIdentifier:  "CarsCollectionViewCellRow")
    }
    
    func didSelectHandler(_ handler: @escaping (_ car: Car) -> Void ) {
        self.didSelect = handler
    }
        
        func setCarsLayout() {
//            1 - Definir layout con dimencion de la acelda
            let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(.leastNormalMagnitude))
//            2 - Definir layout como un item
            let item = NSCollectionLayoutItem(layoutSize: layoutSize)
            
//            3 - Definir un grupo en horizontal o vertical segun direccion del scroll, es un conjunto de items.
            let layoutGroup = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(.leastNormalMagnitude))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroup, subitem: item, count: 1)
            group.interItemSpacing = .fixed(20)
            
//            4 - Definir la seccion que es un cojunto de grupos
            let section = NSCollectionLayoutSection(group: group)
            
//            5 - Definir Atributos del CollectionView.
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15)
            section.interGroupSpacing = 20
            
//            6 - Creas el Layout del collection y se lo asignas...
            let layout = UICollectionViewCompositionalLayout(section: section)
            self.collectionView?.collectionViewLayout = layout
        }
    }


/*
 compocitional layout:
 
 These steps are related to setting up a custom layout for a UICollectionView in iOS using UICollectionViewCompositionalLayout. Each step has a specific purpose in defining the layout of the CollectionView:

 1 - Define the size of the cell layout (layoutSize):
 The size of the cell is defined in terms of its width and height. In this case, .fractionalWidth(1) is used to make the cell occupy the entire available width, and .estimated(.leastNormalMagnitude) is used to estimate a minimum height for the cell.

 2 - Define the layout as an item (NSCollectionLayoutItem):
 An NSCollectionLayoutItem object is created using the layout size defined earlier. This represents the individual element that will be placed in the CollectionView.

 3 - Define a group in horizontal or vertical (NSCollectionLayoutGroup):
 A group containing a set of items is defined. In this case, a horizontal group is created that contains multiple items. The number of items in each row is specified with the count parameter.

 4 - Define the section (NSCollectionLayoutSection):
 A section that groups sets of groups is defined. Here, the group created earlier is assigned to the section object.

 5 - Define attributes of the CollectionView (Insets and spacing between groups):
 The inner margins of the section (contentInsets) and the spacing between adjacent groups (interGroupSpacing) are specified for the CollectionView.

 6 - Create the layout of the CollectionView and assign it (UICollectionViewCompositionalLayout):
 The UICollectionViewCompositionalLayout object is created using the section defined earlier and assigned to the CollectionView.
*/
 
extension ListCardGrillAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.datasource.count
        /*
         This method is required by the UICollectionViewDataSource protocol. It tells the collection view how many items (cells) should be displayed in a particular section. Here, it returns the count of items in the datasource array property of the CarsView class.
         */
    }
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        10
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        CarsCollectionViewCell.buildIN(collectionView, in: indexPath, with: self.datasource[indexPath.item])
        /*
         This method is also required by the UICollectionViewDataSource protocol. It's responsible for configuring and returning a cell for a specific index path in the collection view. Here's what it does:
         Retrieves the car object from the datasource array based on the indexPath.item. This represents the index of the item (cell) within the section.
         Prints the car object. This is likely for debugging purposes.
         Returns a generic UICollectionViewCell. In practice, you'd dequeue and configure a custom cell subclass here instead of returning a generic cell.
         */
    }
}
    
    extension ListCardGrillAdapter: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.didSelect?(self.datasource[indexPath.row])
        }
        /*
         This method is part of the UICollectionViewDelegate protocol and is called when a cell in the collection view is selected by the user. Here's what it does:
         
         - It receives the collectionView object and the indexPath of the selected item.
         - It retrieves the car object from the datasource array based on the indexPath.item, representing the index of the selected item within the section.
         */
}
/*
 Le pasamos el dataSource a la vista para darle ese input y que
 Los hijos UI de la vista nunca deben ser privados, debemos tener metodos de acceso a esos componentes UIHijos.
 Las vistas deben ser objetos autosuficientes
 Todas las ui deben tener un imput y debe saber que hacer con ese input a traves de metodos o de comportaminetos.
 El collectionView mediante el delegado va a informar sus estados "shouldSlectItemAt - didSelectItemAt", ya dependiendo el evento y el metodo seleccionado lograremos generar una accion.
 
El DataSource tiene metodos como la cantidad de items segun la seccion, la cantidad de secciones y la celda que tiene que mostrar; el colection view trabaja con array bidimencional o matriz y array unidireccional y dentro del collectionView tinen una direccion y es l IndexPath.
    IndexPath.section
    IndexPath.item(collectiionView) .row(tableView)
 Array Bidimensional (2D)
 matriz = [
     [1, 2, 3],
     [4, 5, 6],
     [7, 8, 9]
 ]
 
 Array Tridimensional (3D)
 cubo = [
     [
         [1, 2],
         [3, 4]
     ],
     [
         [5, 6],
         [7, 8]
     ]
 ]
 
 Arrays Paralelos: Misma cantidad de elementos y sus indices deben estar fuertemente asociados.
 
 en array unidimencional
 
 section - indice(row)
 0              1
 0              2
 0              3
 0              n
 
 
 */

/*
 Pattern Estrategy:

 Constraints de Posición: Establecen la ubicación absoluta o relativa de
 un elemento en relación con su contenedor padre o con otros
 elementos.
 Punto de referencia (0.0): La esquina superior izquierda del
 contenedor padre.

 Constraints de Alineación: Establecen la alineación de los bordes o centros
 de los elementos con respecto a otros elementos o al
 contenedor padre.

 Constraints de Relación: Definen relaciones entre elementos, como la
 igualdad de anchura o altura, proporciones, o la fijación de
 una dimensión a un valor específico.

 Constraints de Dimensión: Especifican el tamaño de los elementos,
 definiendo su anchura y altura, ya sea de forma fija o
 relativa a otros elementos.

 Constraints Intrínsecos: Son los constraints determinados por las
 características intrínsecas del contenido de un elemento,
 como su contenido de texto o tamaño de imagen.

 Constraints Físicos: Definición: Restricciones geométricas aplicadas a los
 elementos de la interfaz de usuario para definir su posición
 y tamaño de forma relativa. Top, Bottom, Leading, Trailing.
 
 Constraints Lógicos: Son aquellos que se definen de manera
 programática o a través de reglas lógicas en lugar de
 establecerse manualmente en la interfaz de usuario.
 
 Aspect Ratio: Constraint que define la relación de aspecto
 entre la anchura y la altura de un elemento.

 Multiplayer:
 */

