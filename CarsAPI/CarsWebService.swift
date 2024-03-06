//
//  CarsWebService.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.
//

import Foundation
import Alamofire

/*
Alamofire:Alamofire is a popular networking library for
iOS, macOS, watchOS, and tvOS, written in Swift. It provides
a simple and elegant interface for making HTTP requests and
working with responses easily and securely.
 
 Some key features of Alamofire include:
Simplified HTTP requests: Allows for easily making GET,
POST, PUT, DELETE, and other requests, with clear and
concise syntax.

 Request headers and parameters handling: Facilitates the
addition and manipulation of HTTP headers and request
parameters.

Response handling: Provides functions for easily handling
server responses, including JSON, binary data, and other
formats.

Security: Offers support for server authentication, SSL
certificates, and other security features.
Scalability: Is highly scalable and can be used in small to
large-scale applications.

Comprehensive documentation and active community: Alamofire
comes with extensive documentation and an active community
that provides support and additional resources.
 =========================

 Cocoa PODS: Is a dependency manager for Swift and
Objective-C projects, primarily used for managing
third-party libraries and frameworks. It simplifies the
process of integrating external code into your project by
handling the installation, versioning, and dependency
resolution of these libraries.
 */

struct CarsWebService {
    
    let urlString = "https://run.mocky.io/v3/f3af5955-e77d-48cb-b7ef-434fa2988484"
    
    func fetch(completionHandler: @escaping CompletionHandler) {
        AF.request(urlString, method:  .get).response { dataResponse in
            guard let data = dataResponse.data else {return}
            let arrayResponse = try? JSONDecoder().decode([CarDTO].self, from: data)
            completionHandler(arrayResponse ?? [])}
    }
}


//MARK: - Clousures
/* Clousure: "A closure in Swift is like a small block of
code that you can save and use later in your program. It's
like a recipe that you define once and then you can use it
multiple times in different parts of your code. You can put
any type of instruction or calculation in a closure, and you
can even use data from your program inside it. It's useful
when you want to do something special that you don't need to
write as a separate function.

Closures in Swift have the ability to capture and store
references to variables and constants from their surrounding
context. This means they can access and modify values that
are defined outside of their own body.

1 - Passing functions as arguments to other functions.
2 - Defining custom behavior for methods like map, filter, and reduce.
3 - Capturing and storing references to variables and constants in their surrounding context.
                                    
                                    let sum: (Int, Int) -> Int = { (a, b) in
                                        return a + b
                                    }

                                    let result = sum(3, 5) // result will be 8
 ==========================================================================
 CompletionHandler: A CompletionHandler in Swift is a type of
 closure commonly used to handle the completion of an
 asynchronous operation. Essentially, it's a function that is
 called once a task completes, either successfully or with an
 error.
 
 This type of closure is widely used in iOS and macOS
 development to handle network responses, asynchronous data
 requests, background data processing operations, among
 others.

 A CompletionHandler typically has a signature that
 specifies the data passed as a result of the asynchronous
 operation, as well as any error that may occur during the
 operation. For example:
 
 In this case, you have a struct named CarsWebService that
 represents a web service for fetching car data from a
 specific URL.

 Inside the CarsWebService struct, there's a property named
 urlString which holds the URL of the web service endpoint.

 The fetch method is responsible for making a network request
 to the specified URL using Alamofire (AF.request). It
 performs a GET request and asynchronously retrieves the
 response data. Once the response data is obtained, it
 attempts to decode the data into an array of CarDTO objects
 using JSONDecoder. Finally, it calls the completionHandler
 closure, passing the decoded array of CarDTO objects to it.
 If decoding fails, it passes an empty array to the
 completion handler.

 The CompletionHandler typealias is defined as a closure that
 takes an array of CarDTO objects as input and returns void
 (Void). This typealias is used to define the signature of
 the completion handler closure expected by the fetch method.

 Overall, the CarsWebService struct encapsulates the logic
 for fetching car data from a web service endpoint and
 provides a completion handler mechanism for handling the
 fetched data asynchronously.


 */

extension CarsWebService {
    typealias CompletionHandler = (_ arrayCarsDTO: [CarDTO]) -> Void
}


//MARK: - DTO
/*
 unasafe variable: The term unsafe varibale to refers to an variable of this type, tendens to crash, when  make a unwraping the data consult are safe
 ============================================================
 Codable, Decodable, and Encodable:  are three related
 protocols in Swift's standard library that enable the
 encoding and decoding of Swift objects to and from external
 representations such as JSON, Property Lists, or other
 custom formats.
 
 Codable: Codable is a typealias in Swift that combines
 Decodable and Encodable. It's a protocol that indicates a
 type can be both encoded to and decoded from an external
 representation.
 
 Decodable: Decodable is a protocol that indicates a type can
 be decoded from an external representation, such as JSON.
 Types that conform to Decodable can be used to decode data
 using a decoder, typically JSONDecoder.
 
 Encodable: Encodable is a protocol that indicates a type can
 be encoded to an external representation, such as JSON.
 Types that conform to Encodable can be used to encode data
 using an encoder, typically JSONEncoder.
 
 In Swift, if you want to convert a Swift object to JSON,
 you'll conform it to Encodable. If you want to convert JSON
 to a Swift object, you'll conform it to Decodable. If you
 need both encoding and decoding capabilities, you'll conform
 it to Codable.
 ============================================================
 Result: Result in Swift is an enumeration type used to
 represent the outcome of an operation that can either fail
 or succeed. It's a way to handle errors explicitly and
 safely in code, without having to throw and catch
 exceptions.
 
 The Result enumeration has two possible cases:

 success: Represents the successful outcome of an operation.
 It contains the associated value that resulted from the
 successful operation.
 failure: Represents the failed outcome of an operation. It
 contains the associated error that describes the reason for
 the failure.
 Here's an example of how Result can be used in Swift:
 
 enum NetworkError: Error {
     case noInternetConnection
     case serverError
 }

 func fetchData(completion: @escaping (Result<String, NetworkError>) -> Void) {
     if isConnectedToInternet() {
         // Simulación de éxito
         completion(.success("Datos obtenidos correctamente"))
     } else {
         // Simulación de fallo
         completion(.failure(.noInternetConnection))
     }
 }

 // Uso de fetchData
 fetchData { result in
     switch result {
     case .success(let data):
         print("Éxito: \(data)")
     case .failure(let error):
         print("Fallo: \(error)")
     }
 }
 In this example, fetchData is a function that attempts to
 fetch data from an external source (e.g., a network
 request). The function takes a completion closure that takes
 a Result as an argument. Inside fetchData, the completion
 closure is called with a Result that contains either the
 success and the fetched data or the failure and the
 corresponding error.
 ======================================================
 
 Reactividad: "Reactivity" in Swift refers to the ability of
 an application to automatically respond to changes in data
 or the application state, updating the user interface
 accordingly. This is especially important in the development
 of user interface applications, where data may change over
 time and it's crucial that the user interface reflects those
 changes immediately and efficiently.
 
 In Swift, reactivity can be achieved in several ways, including:

 Property observers: By using Swift's property observer
 functionality (e.g., didSet), you can detect when a property
 changes and perform actions in response to that change.
 
 Observer design pattern: Implementing the Observer design
 pattern, where interested objects register to receive
 notifications when changes occur in an observed object. This
 can be achieved using custom classes and protocols, or
 through APIs provided by frameworks like UIKit or Combine.
 
 Bindings: Using binding mechanisms provided by frameworks
 like SwiftUI or Combine, where you can establish direct
 relationships between data properties and user interface
 views, so that changes in the data are automatically
 reflected in the user interface and vice versa.
 =====================================================
DTO: DTO stands for "Data Transfer Object." It is a design
pattern used to transfer data between different components
of a software system, such as application layers, web
services, or network clients.
 
 The main purpose of a DTO is to encapsulate data and send it
 from one place to another efficiently and without additional
 processing. Typically, a DTO is a simple data structure that
 contains fields or properties to represent the data being
 transferred.
 
 */
                                    
extension CarsWebService {
    struct CarDTO: Decodable {
        let model: String?
        let brand: String?
        let year: Int?
        let urlImage: String?
        let description: String?
        let horsePower: String?
    }
}

