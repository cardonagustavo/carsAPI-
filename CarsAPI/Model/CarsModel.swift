//
//  CarsModel.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.

import Foundation

/*
 // Data Model: A data model is a conceptual representation of the structure and relationships of data within a system. It defines the organization, format, and rules for storing and manipulating data, providing a blueprint for how data is managed and accessed within an application or database.
 
 */

struct Car {
    let model: String
    let brand: String
    private let year: Int?
    let urlImage: String
    let overview: String
    private let hp: Int
    
    var power: String {
        "\(self.hp) HP"
    }
    
    var fullName: String {
        "\(self.brand) * \(self.model)"
    }
    
    var realeaseYear: String {
        guard let year = self.year else {
            return "soon"
        }
        return "\(year)"
    }
    /*
    This line declares an initializer method for a class or
    structure. The method takes a parameter dto of type
    CarsWebService.CarDTO, which is a data transfer object (DTO)
    representing information about a car.
     */
    init(dto: CarsWebService.CarDTO) {
        /*
        Here, self.model is assigned the value of dto.model. The ??
        operator is the nil-coalescing operator. It provides a
        default value ("---") if the optional value on its left-hand
        side (dto.model) is nil.
         */
        self.model = dto.model ?? "---"
        self.brand = dto.brand ?? "---"
        self.year = dto.year
        self.urlImage = dto.urlImage ?? ""
        self.overview = dto.description ?? "Description not available"
        self.hp = Int(dto.horsePower ?? "0") ?? 0
    }
}

/*
    In this extension provides a computed property toCar on
    arrays of CarDTO elements. When accessed, it transforms each
    CarDTO element into a corresponding Car object, effectively
    converting an array of DTOs into an array in actual Car
    elements.
 */

extension Array where Element == CarsWebService.CarDTO {
    var toCars: [Car] {
        self.map({Car(dto: $0)})
    }
    /*
     var toCars: Define una propiedad calculada llamada toCars.
     Esta propiedad devuelve un arreglo de objetos de tipo Car.
     self.map({Car(dto: $0)}): Utiliza el método map(_:) para
     iterar sobre cada elemento del arreglo original (self).
     
     Para cada elemento $0 del arreglo, se crea un nuevo objeto Car
     utilizando un inicializador que toma un objeto del mismo
     tipo que los elementos del arreglo original (dto). 
     
     El resultado es un arreglo de objetos Car creado a partir de
     los elementos del arreglo original.

     En resumen, esta extensión de la clase Array proporciona una
     forma conveniente de convertir un arreglo de objetos DTO
     (objeto de transferencia de datos) en un arreglo de objetos
     Car. 
     
     Esto puede ser útil cuando se necesita convertir datos
     DTO recibidos de una API u otra fuente de datos en objetos
     de modelo de la aplicación.
     */
}
