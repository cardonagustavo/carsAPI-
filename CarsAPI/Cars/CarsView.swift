//  CarsView.swift
//  CarsAPI
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.

import UIKit

protocol CarsViewDelegate: AnyObject {
    func carsView(_ carsView: CarsView, didSelectCar car: Car)
}

class CarsView: UIView {
    
    private lazy var clvCars: UICollectionView = {
        let clv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        clv.backgroundColor = .white
        clv.showsVerticalScrollIndicator = false
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
    }()
    /*
     .Zero: lo usamos para indicar a la la UI que el punto inicial del proyecto va a ser 0 en X y 0 en Y.
     translatesAutoresizingMaskIntoConstraints:  es ta linea es la que va a permitir mostrar el collection usando el .zero
     */
    
    
 //   @IBOutlet private weak var clvCars: UICollectionView!
    weak var delegate: CarsViewDelegate?
    private var listAdapter: ListCarAdapterProtocol?
    /*
     Ratio: "Image ratio" usually refers to the proportional relationship between the width and height of an image. It describes how many times wider an image is compared to its height or vice versa. For example, an image with a ratio of 4:3 means that its width is 4 units for every 3 units of height.
     - When you're displaying images in a UICollectionView, you might want to maintain the aspect ratio of the images so they don't appear stretched or distorted. This means ensuring that the width-to-height ratio of each image remains the same as the original image.
     */
    
    //    var datasource = [Car]() {
    //        didSet {
    //            self.clvCars.reloadData()
    
    init(listAdapter: ListCarAdapterProtocol) {
        self.listAdapter = listAdapter
        super.init(frame: .zero)
        self.addElements()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addElements()
    }
    
    
    func setupAdapters() {
        self.listAdapter?.setCollectionView(self.clvCars)
        
        self.listAdapter?.didSelectHandler {car in
        self.delegate?.carsView(self, didSelectCar: car)
        }
    }
    
    func reloadData(_ datasource: [Car]) {
        self.listAdapter?.datasource = datasource
        self.clvCars.reloadData()
    }
    
    func addElements() {
        self.backgroundColor = .white
        self.addSubview(self.clvCars)
        
        
        NSLayoutConstraint.activate([
            self.clvCars.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.clvCars.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.clvCars.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.clvCars.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        /*
        creamos este metodo y lo utilizaremos para poder agregar todos los componentes UI, todos los hijos
        IMPORTANTE: si agregamos constraints, antes de agregarlo como hijo al elemento dentro de una vista, sin que este elemento tenga un padre que lo contenga entonces generara un crash, el orden siempre tiene que ser este creacion, configuracion, agregarlos como hijo y despues agregamos constraints, estos constraints que tiene que ser en este orden tiene que ser de la siguiente manera, son unicamente los constraints de ubicacion, porque los constraints de dimension, width como height los podemos agregar en la declaracion de la funcion implementada, es decir si queremos que el collectionView tenga una altura constante podemos agregar ese constraint por codigo en la creacion
        Los unicos constraints que podemos agregar en la creacion (funcion implementada, funcion de construccion) son los de dimension, pero si queremos agregar constraints de alineacion, de relacion o de posicion tienen que ser agregados despues de que ese elemento sea puesto como hijo de alguien
        self.addSubview(self.clvCars) la ponemos como hijo, agregamos una subview, es decir a CarView la vamos a poner como padre del collectionView/clvCars
        Dos maneras de agg constraints, manera comun, con anchorConstraints, pero esta tendra dos utilidades, activacion de constraints masivos y de independientes
        NSLayoutConstraint.activate: Activar constraints de manera masiva y nos pedira que le enviemos un array de constraints
        Si tenemos varios elementos y queremos agregar constraints a todos por medio de la funion activate de NSLayoutConstraint va a ser muy dificil luego alterar o modificar constraints de algun elemento por ejemplo el bottom para la aparicion del teclado, asi que si queremos retener un constraint private var bottomAnchorClv: NSLayoutConstraint?
         
         NSLayoutConstraint.activate([...]): Este método se utiliza para activar una matriz de constraints a la vez. Es una forma conveniente de aplicar múltiples constraints simultáneamente.
         
         self.clvCars.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0): Este constraint establece que el borde superior de la colección de vistas (clvCars) debe ser igual al borde superior seguro (safeAreaLayoutGuide.topAnchor) del contenedor, con una separación adicional de 0 puntos. El safeAreaLayoutGuide es un área segura que asegura que las vistas no se superpongan con la barra de estado, la barra de navegación, la barra de pestañas o cualquier otra barra visible en la pantalla.
         
         self.clvCars.leadingAnchor.constraint(equalTo: self.leadingAnchor): Este constraint establece que el borde izquierdo de la colección de vistas (clvCars) debe ser igual al borde izquierdo del contenedor.
         
         self.clvCars.trailingAnchor.constraint(equalTo: self.trailingAnchor): Este constraint establece que el borde derecho de la colección de vistas (clvCars) debe ser igual al borde derecho del contenedor.
         
         self.clvCars.bottomAnchor.constraint(equalTo: self.bottomAnchor): Este constraint establece que el borde inferior de la colección de vistas (clvCars) debe ser igual al borde inferior del contenedor.
         */
        
    }
}


        /*
        -  This line creates a variable called datasource, which holds an array of Car objects.
        -  Whenever the datasource array changes (like adding, removing, or modifying items), the code inside the {} block gets executed.
        -  Inside this block, self.clvCars.reloadData() is called. This function tells a collection view (clvCars) to refresh its data to reflect any changes in the datasource.
         
        -  is an a bad implementation becasuse when dos you need modify de array can be it generate an error, for practically moment this implementation put here but it will be moved to adapter.
         
         didSet {
             self.clvCars.reloadData()
         }
         */
//    }
    
//    func setList() {
//        self.clvCars.dataSource = self
//        self.clvCars.delegate = self
//    }
    /*
     This function, setList(), is responsible for configuring a collection view (clvCars).
     It sets two important properties of the collection view:
     dataSource: This property tells the collection view where to get its data from. By setting it to self, the current class is saying, "I'll provide the data."
     delegate: This property is responsible for handling interactions and layout of the collection view. Again, by setting it to self, the current class is saying, "I'll handle those tasks."
     */



//robet c martin autor
