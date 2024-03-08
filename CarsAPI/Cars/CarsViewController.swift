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
    /*
     super.viewDidLoad(): Llama al método viewDidLoad() de la
     clase base (UIViewController). Este paso es importante para
     asegurar que cualquier inicialización necesaria de la vista
     controladora se realice correctamente.
     
     self.view = self.carsView: Asigna la vista de la
     controladora (view) con la vista de lista de automóviles
     (carsView). Esto indica que la vista de lista de automóviles
     será la vista principal que se muestra en la pantalla cuando
     se presente este controlador de vista.
     
     self.carsView.delegate = self: Establece el delegado de la
     vista de lista de automóviles (carsView) como el propio
     controlador de vista. Esto significa que el controlador de
     vista será responsable de manejar los eventos y acciones que
     ocurren en la vista de lista de automóviles.
     
     self.carsView.setupAdapters(): Llama al método
     setupAdapters() en la vista de lista de automóviles
     (carsView). Este método se utiliza para configurar los
     adaptadores asociados con la vista de lista de automóviles,
     como se explicó anteriormente.
     
     self.getAll(): Llama al método getAll() en el controlador de
     vista. Este método probablemente se utiliza para obtener
     todos los datos necesarios para mostrar en la vista de lista
     de automóviles. Por ejemplo, puede recuperar una lista de
     automóviles de una base de datos o de un servicio web.
     */
        
       private func getAll() {
            self.webSerice.fetch { arrayCarsDTO in
                self.carsView.reloadData(arrayCarsDTO.toCars)
            }
        }
    /*
     self.webService.fetch { arrayCarsDTO in ... }: Llama al
     método fetch() del servicio web (webService). Este método
     probablemente se utiliza para realizar una solicitud al
     servidor para obtener datos relacionados con automóviles. El
     código dentro del bloque de cierre ({ ... }) se ejecutará
     una vez que se hayan recibido los datos del servidor.

     self.carsView.reloadData(arrayCarsDTO.toCars): Dentro del
     bloque de cierre, llama al método reloadData(_:) en la vista
     de lista de automóviles (carsView). Este método se utiliza
     para actualizar los datos que se muestran en la vista de
     lista de automóviles. Se pasa el array de objetos CarDTO
     (arrayCarsDTO) al método toCars, que probablemente convierte
     los objetos CarDTO en objetos Car antes de recargar los
     datos en la vista.
     */
    
    init(carView: CarsView) {
        self.carsView = carView
        super.init(nibName:  nil, bundle: nil)
    }
    /*
     init(carView: CarsView) {: Esto define un inicializador
     personalizado que toma un parámetro carView de tipo
     CarsView. Este inicializador se utiliza para crear una
     instancia del controlador de vista y asociarla con una vista
     de lista de automóviles específica (CarsView).
     
     self.carsView = carView: Asigna la vista de lista de
     automóviles proporcionada (carView) a la propiedad carsView
     del controlador de vista. Esto establece la relación entre
     el controlador de vista y la vista de lista de automóviles
     que se utilizará para mostrar los datos y responder a las
     interacciones del usuario.
     
     super.init(nibName: nil, bundle: nil): Llama al
     inicializador designado de la clase base (UIViewController)
     para completar la inicialización del controlador de vista.
     Los parámetros nibName y bundle se establecen en nil, lo que
     significa que el controlador de vista no utiliza un archivo
     de interfaz de usuario específico (nib) y carga la interfaz
     de usuario desde el código en su lugar.
     
     Se omite el requerimiento required init?(coder: NSCoder) ya
     que no está presente en este fragmento de código. Este
     inicializador sería necesario si el controlador de vista se
     inicializara desde un archivo de interfaz de usuario
     (storyboard o archivo .xib).
     */
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
    /*
     required init?(coder: NSCoder) {: Esto define un
     inicializador requerido para cumplir con el protocolo
     NSCoding. Este inicializador se utiliza cuando se instancia
     un objeto a partir de datos codificados, por ejemplo, cuando
     se carga un objeto desde un archivo de interfaz de usuario
     (storyboard o archivo .xib).
     
     fatalError("init(coder:) has not been implemented"): Dentro
     del inicializador, se llama a fatalError para indicar que la
     implementación del inicializador desde un codificador no ha
     sido proporcionada. Esto detendrá la ejecución del programa
     si se intenta inicializar un objeto de esta clase desde un
     codificador, lo que indica que este inicializador no es
     compatible y debe ser implementado correctamente.
       */
}


extension CarsViewController: CarsViewDelegate {
    func carsView(_ carsView: CarsView, didSelectCar car: Car) {
        //TODO: - Navigate to detail of selected car    
    }
    
    /*
     extension CarsViewController: CarsViewDelegate {: Esto
     declara una extensión para la clase CarsViewController que
     implementa el protocolo CarsViewDelegate. Esto significa que
     CarsViewController ahora debe proporcionar una
     implementación para todos los métodos requeridos por el
     protocolo CarsViewDelegate.
     
     func carsView(_ carsView: CarsView, didSelectCar car: Car)
     {: Implementa el método carsView(_:didSelectCar:) del
     protocolo CarsViewDelegate. Este método se llama cuando un
     automóvil se selecciona en la vista de lista de automóviles.
     Toma dos parámetros: la vista de lista de automóviles
     (carsView) y el automóvil seleccionado (car).
     
     //TODO: - Navigate to detail of selected car: Este es un
     comentario que indica que se debe implementar la navegación
     a los detalles del automóvil seleccionado en esta función.
     La navegación podría implicar mostrar una nueva vista de
     detalle que muestre información detallada sobre el automóvil
     seleccionado.
     
     En resumen, esta extensión agrega la implementación del
     método carsView(_:didSelectCar:) del protocolo
     CarsViewDelegate a la clase CarsViewController. Esta
     implementación manejará el evento de selección de
     automóviles en la vista de lista de automóviles y podría
     incluir la navegación a una vista de detalle para mostrar
     información detallada sobre el automóvil seleccionado.
     */
}

//Compositional layout

