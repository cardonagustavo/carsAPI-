//
//  CarViewRepresentable.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.
//

import SwiftUI

struct CarsViewRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    /*
     La función updateUIViewController es uno de los métodos
     requeridos por el protocolo UIViewControllerRepresentable.
     Se utiliza para actualizar la vista de controlador de vista
     (uiViewController) cuando cambian los datos o el contexto
     relevante para la vista representada.
     */
    
    func makeUIViewController(context: Context) -> some UIViewController {
//      CarsViewController.buildGrill()
        CarsViewController.buildSimple()
    }
    
    /*
     unc makeUIViewController(context: Context) -> some
     UIViewController {: Este método devuelve una instancia de
     UIViewController que será utilizada por SwiftUI. Toma un
     parámetro de contexto (Context), que puede proporcionar
     información adicional sobre el entorno en el que se está
     creando la vista.
     
     CarsViewController.buildSimple(): En esta línea, se llama a
     un método estático buildSimple() de la clase
     CarsViewController. Este método probablemente está diseñado
     para construir y configurar una instancia específica de
     CarsViewController con una configuración simple. La
     instancia de CarsViewController creada se devuelve como un
     UIViewController.
     
     some UIViewController: El tipo de retorno de este método se
     especifica como some UIViewController, lo que significa que
     SwiftUI no necesita conocer el tipo exacto de
     UIViewController que se devuelve, solo que es un
     UIViewController. Esto proporciona flexibilidad en el tipo
     de UIViewController que puede ser devuelto, lo que permite
     un diseño más genérico y reutilizable.
     */
}

struct CarsViewPreview: PreviewProvider {
    static var previews: some View {
        CarsViewRepresentable()
    }
    /*
     La función previews es un requisito del protocolo
     PreviewProvider. Devuelve una vista que se mostrará en el
     lienzo de previsualización de Xcode. En este caso, se
     devuelve una instancia de CarsViewRepresentable, que es una
     vista representable de UIKit que se utiliza para integrar
     vistas de UIKit en SwiftUI.
     */
}
