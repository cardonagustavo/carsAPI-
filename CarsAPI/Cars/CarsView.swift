//  CarsView.swift
//  CarsAPI
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.

import UIKit

protocol CarsViewDelegate: AnyObject {
    func carsView(_ carsView: CarsView, didSelectCar car: Car)
}

class CarsView: UIView {
    
    private lazy var clvCars: UICollectionView = {
        let clv  = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        clv.backgroundColor = .white
        clv.showsVerticalScrollIndicator = false
        clv.translatesAutoresizingMaskIntoConstraints = false
        return clv
    }()
    /*
     This variable controls the behavior of Auto Layout in a
     collectionView cell. When
     translatesAutoresizingMaskIntoConstraints is active, Auto
     Layout automatically uses the existing autoresizing masks to
     generate constraints. However, when using custom
     constraints, as is common in advanced UI development,
     autoresizing masks are disabled. This allows for more
     precise and flexible control over the layout of the cell.
     */
    
    private lazy var srcCars: UISearchBar = {
        let src = UISearchBar(frame: .zero)
        self.addElements()
        return src
    }()
    /*
     private lazy var srcCars: UISearchBar: Declara una propiedad
     privada llamada srcCars que es de tipo UISearchBar. La
     palabra clave lazy indica que la inicialización de esta
     propiedad se pospone hasta que sea necesario, lo que
     significa que no se crea la instancia de UISearchBar hasta
     que la propiedad srcCars sea accedida por primera vez.

     = { ... }(): Asigna un cierre (closure) autoejecutable a la
     propiedad srcCars. Esto significa que el código dentro de
     las llaves {} se ejecuta inmediatamente después de la
     declaración y se utiliza para inicializar la propiedad. La
     () al final de la declaración de cierre indica que el cierre
     debe ejecutarse inmediatamente.

     let src = UISearchBar(frame: .zero): Dentro del cierre, se
     crea una instancia de UISearchBar llamada src con un marco
     (frame) inicial de tamaño cero. Esto crea la barra de
     búsqueda sin ningún tamaño inicial.

     self.addElements(): Llama al método addElements() en el
     objeto actual (probablemente un controlador de vista) para
     agregar elementos adicionales, como la barra de búsqueda, a
     la interfaz de usuario.

     return src: Retorna la instancia de UISearchBar creada, que
     luego se asigna a la propiedad srcCars.
     */
    

    /*
     .Zero: lo usamos para indicar a la la UI que el punto
     inicial del proyecto va a ser 0 en X y 0 en Y.
     translatesAutoresizingMaskIntoConstraints:  es ta linea es
     la que va a permitir mostrar el collection usando el .zero
     */
    
    
 //   @IBOutlet private weak var clvCars: UICollectionView!
    weak var delegate: CarsViewDelegate?
    private var listAdapter: ListCarAdapterProtocol?
    private var searchAdapter: SearchCarAdapterProtocol?
    /*
     Ratio: "Image ratio" usually refers to the proportional
     relationship between the width and height of an image. It
     describes how many times wider an image is compared to its
     height or vice versa. For example, an image with a ratio of
     4:3 means that its width is 4 units for every 3 units of
     height.
     - When you're displaying images in a UICollectionView, you
     might want to maintain the aspect ratio of the images so
     they don't appear stretched or distorted. This means
     ensuring that the width-to-height ratio of each image
     remains the same as the original image.
     */
    
    //    var datasource = [Car]() {
    //        didSet {
    //            self.clvCars.reloadData()
    
    init(listAdapter: ListCarAdapterProtocol, searchAdapter: SearchCarAdapterProtocol) {
        self.listAdapter = listAdapter
        self.searchAdapter = searchAdapter
        super.init(frame: .zero)
        self.addElements()
    }
    /*
     init(listAdapter: ListCarAdapterProtocol) {: Esto define un
     inicializador personalizado para la clase. Toma un parámetro
     listAdapter que debe ser de tipo ListCarAdapterProtocol, que
     es un protocolo definido en el código.
     
     self.listAdapter = listAdapter: Asigna el valor del
     parámetro listAdapter al miembro de la clase listAdapter.
     Presumiblemente, este adaptador de lista se utilizará para
     configurar la vista en algún momento posterior.
     super.init(frame: .zero): Llama al inicializador de la clase
     base (UIView o similar) con un marco (frame) de tamaño cero.
     Esto inicializa la parte de la vista que es manejada por la
     clase base.
     
     self.addElements(): Llama al método addElements() en el
     objeto actual (probablemente un controlador de vista) para
     agregar elementos adicionales a la interfaz de usuario. Este
     método podría ser responsable de configurar subvistas
     adicionales o aplicar diseños específicos a la vista.
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
    }
    
    /*
     init(listAdapter: ListCarAdapterProtocol) {: Esto define un
     inicializador personalizado para la clase. Toma un parámetro
     listAdapter que debe ser de tipo ListCarAdapterProtocol, que
     es un protocolo definido en el código.
     
     self.listAdapter = listAdapter: Asigna el valor del
     parámetro listAdapter al miembro de la clase listAdapter.
     Presumiblemente, este adaptador de lista se utilizará para
     configurar la vista en algún momento posterior.
     
     super.init(frame: .zero): Llama al inicializador de la clase
     base (UIView o similar) con un marco (frame) de tamaño cero.
     Esto inicializa la parte de la vista que es manejada por la
     clase base.
     
     self.addElements(): Llama al método addElements() en el
     objeto actual (probablemente un controlador de vista) para
     agregar elementos adicionales a la interfaz de usuario. Este
     método podría ser responsable de configurar subvistas
     adicionales o aplicar diseños específicos a la vista.
     */
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addElements()
    }
    /*
     required init?(coder: NSCoder) {: Esto define un
     inicializador requerido para cumplir con el protocolo
     NSCoding. Este inicializador se utiliza cuando se instancia
     un objeto a partir de datos codificados, por ejemplo, cuando
     se carga un objeto desde un archivo de interfaz de usuario
     (storyboard o archivo .xib).

     super.init(coder: coder): Llama al inicializador de la clase
     base (UIView o similar) con el codificador proporcionado
     (coder). Esto permite que la clase base realice cualquier
     inicialización necesaria utilizando los datos codificados.

     self.addElements(): Llama al método addElements() en el
     objeto actual (probablemente un controlador de vista) para
     agregar elementos adicionales a la interfaz de usuario. Este
     método podría ser responsable de configurar subvistas
     adicionales o aplicar diseños específicos a la vista.
     */
    
    func setupAdapters() {
        self.listAdapter?.setCollectionView(self.clvCars)
        self.searchAdapter?.setSearchBar(self.srcCars)
        
        self.listAdapter?.didSelectHandler {car in
        self.delegate?.carsView(self, didSelectCar: car)
           
        }
        self.searchAdapter?.didFilterHandler({ cars in
            self.reloadCollectionViewWith(cars)
        })
    }
    
    private func reloadCollectionViewWith(_ datasourse: [Car]) {
        self.listAdapter?.datasource = datasourse
        self.clvCars.reloadData()
    }
    /*
     self.listAdapter?.setCollectionView(self.clvCars): Llama al método
     setCollectionView(_:) en el adaptador de lista (listAdapter) asociado con la
     vista de lista de automóviles. Este método probablemente se utiliza para
     establecer la colección de vistas (clvCars) en el adaptador de lista, lo que
     indica que el adaptador de lista ahora se encargará de administrar la colección
     de vistas.
     self.listAdapter?.didSelectHandler {car in ... }: Llama al método
     didSelectHandler(_:) en el adaptador de lista (listAdapter). Este método parece
     ser un mecanismo para configurar un controlador de selección de elementos en el
     adaptador de lista. El bloque de código proporcionado ({...}) se ejecutará
     cuando se seleccione un automóvil en la colección de vistas. Dentro de este
     bloque, se llama al método carsView(_:didSelectCar:) en el delegado de la vista
     de lista de automóviles (delegate), pasando el automóvil seleccionado como
     argumento.
     */
    
    func reloadData(_ datasource: [Car]) {
        self.searchAdapter?.datasource = datasource
        self.reloadCollectionViewWith(datasource)
    }
    /*
     self.listAdapter?.datasource = datasource: Asigna la nueva
     fuente de datos de automóviles (datasource) al adaptador de
     lista (listAdapter). Este paso es necesario para actualizar
     los datos que serán mostrados en la vista de lista de
     automóviles. El adaptador de lista probablemente se
     encargará de actualizar la interfaz de usuario en función de
     los nuevos datos proporcionados.
     
     self.clvCars.reloadData(): Llama al método reloadData() en
     la colección de vistas (clvCars). Este método se utiliza
     para notificar a la colección de vistas que debe volver a
     cargar y mostrar los datos actualizados. Después de llamar a
     este método, la colección de vistas actualizará su contenido
     para reflejar los cambios en los datos de automóviles.
     */
    
    func addElements() {
        self.backgroundColor = .white
        self.addSubview(self.clvCars)
        self.addSubview(self.srcCars)
        /*
         self.backgroundColor = .white: Establece el color de fondo
         de la vista en blanco. Esto asegura que el fondo de la vista
         sea de color blanco.
         
         self.addSubview(self.clvCars): Agrega la colección de vistas
         (clvCars) como una subvista de la vista actual. Esto
         significa que la colección de vistas será colocada dentro de
         la vista y se mostrará en la pantalla como parte de la vista
         principal.
         
         self.addSubview(self.srcCars): Agrega la barra de búsqueda
         (srcCars) como una subvista de la vista actual. Esto
         significa que la barra de búsqueda será colocada dentro de
         la vista y se mostrará en la pantalla como parte de la vista
         principal.
         */
        
        NSLayoutConstraint.activate([
            self.srcCars.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.srcCars.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.srcCars.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.clvCars.topAnchor.constraint(equalTo: self.srcCars.bottomAnchor),
            self.clvCars.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.clvCars.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.clvCars.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        /*
        creamos este metodo y lo utilizaremos para poder agregar
        todos los componentes UI, todos los hijos
        IMPORTANTE: si agregamos constraints, antes de agregarlo
        como hijo al elemento dentro de una vista, sin que este
        elemento tenga un padre que lo contenga entonces generara un
        crash, el orden siempre tiene que ser este creacion,
        configuracion, agregarlos como hijo y despues agregamos
        constraints, estos constraints que tiene que ser en este
        orden tiene que ser de la siguiente manera, son unicamente
        los constraints de ubicacion, porque los constraints de
        dimension, width como height los podemos agregar en la
        declaracion de la funcion implementada, es decir si queremos
        que el collectionView tenga una altura constante podemos
        agregar ese constraint por codigo en la creacion
        Los unicos constraints que podemos agregar en la creacion
        (funcion implementada, funcion de construccion) son los de
        dimension, pero si queremos agregar constraints de
        alineacion, de relacion o de posicion tienen que ser
        agregados despues de que ese elemento sea puesto como hijo
        de alguien
        self.addSubview(self.clvCars) la ponemos como hijo,
        agregamos una subview, es decir a CarView la vamos a poner
        como padre del collectionView/clvCars
        Dos maneras de agg constraints, manera comun, con
        anchorConstraints, pero esta tendra dos utilidades,
        activacion de constraints masivos y de independientes
        NSLayoutConstraint.activate: Activar constraints de manera
        masiva y nos pedira que le enviemos un array de constraints
        Si tenemos varios elementos y queremos agregar constraints a
        todos por medio de la funion activate de NSLayoutConstraint
        va a ser muy dificil luego alterar o modificar constraints
        de algun elemento por ejemplo el bottom para la aparicion
        del teclado, asi que si queremos retener un constraint
        private var bottomAnchorClv: NSLayoutConstraint?

          NSLayoutConstraint.activate([...]): Este método se utiliza
        para activar una matriz de constraints a la vez. Es una
        forma conveniente de aplicar múltiples constraints
        simultáneamente.

          self.clvCars.topAnchor.constraint(equalTo:
        self.safeAreaLayoutGuide.topAnchor, constant: 0): Este
        constraint establece que el borde superior de la colección
        de vistas (clvCars) debe ser igual al borde superior seguro
        (safeAreaLayoutGuide.topAnchor) del contenedor, con una
        separación adicional de 0 puntos. El safeAreaLayoutGuide es
        un área segura que asegura que las vistas no se superpongan
        con la barra de estado, la barra de navegación, la barra de
        pestañas o cualquier otra barra visible en la pantalla.

          self.clvCars.leadingAnchor.constraint(equalTo:
        self.leadingAnchor): Este constraint establece que el borde
        izquierdo de la colección de vistas (clvCars) debe ser igual
        al borde izquierdo del contenedor.

          self.clvCars.trailingAnchor.constraint(equalTo:
        self.trailingAnchor): Este constraint establece que el borde
        derecho de la colección de vistas (clvCars) debe ser igual
        al borde derecho del contenedor.

          self.clvCars.bottomAnchor.constraint(equalTo:
        self.bottomAnchor): Este constraint establece que el borde
        inferior de la colección de vistas (clvCars) debe ser igual
        al borde inferior del contenedor.
         */
    }
}


        /*
        -  This line creates a variable called datasource, which
        holds an array of Car objects.
        -  Whenever the datasource array changes (like adding,
        removing, or modifying items), the code inside the {} block
        gets executed.
        -  Inside this block, self.clvCars.reloadData() is called.
        This function tells a collection view (clvCars) to refresh
        its data to reflect any changes in the datasource.

        -  is an a bad implementation becasuse when dos you need
        modify de array can be it generate an error, for practically
        moment this implementation put here but it will be moved to
        adapter.

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
     This function, setList(), is responsible for configuring a
     collection view (clvCars).
     It sets two important properties of the collection view:
     dataSource: This property tells the collection view where to
     get its data from. By setting it to self, the current class
     is saying, "I'll provide the data."
     delegate: This property is responsible for handling
     interactions and layout of the collection view. Again, by
     setting it to self, the current class is saying, "I'll
     handle those tasks."
     */



//robet c martin autor
