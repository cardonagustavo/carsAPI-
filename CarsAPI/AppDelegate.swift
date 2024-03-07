//  AppDelegate.swift
//  CarsAPI
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        CarsWebService().fetch {arrayCarsDTO in
//            /*
//             var arrayCars = [Car]()
//             for dto in arrayCarsDTO {
//             arrayCars.append(dto: dto)
//             }
//             let arrayCars = arrayCarsDTO.map { dto in
//             return Car(dto: dto)
//             }
//             //This block of code appears to be commented out, but it seems to be attempting to loop through each CarDTO object in arrayCarsDTO, create a new Car object for each one using the initializer Car(dto: dto), and then append it to the arrayCars array. However, the syntax arrayCars.append(dto: dto) is incorrect; it should be arrayCars.append(Car(dto: dto)).
//              
//             
//             let arrayCars = arrayCarsDTO.map({ Car(dto: $0) })
//             print(arrayCars)
//             
//            //This block of code is also commented out. It uses the map function to transform each CarDTO element in arrayCarsDTO into a Car object using the initializer Car(dto: dto).
//             
//             */
//            
//            let arrayCars = arrayCarsDTO.toCars
//            //This line creates a new array arrayCars by using the toCars computed property on the arrayCarsDTO. The toCars property converts each element of arrayCarsDTO from type CarDTO to type Car using the mapping defined in the extension.
//            //
//            print(arrayCars)
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

