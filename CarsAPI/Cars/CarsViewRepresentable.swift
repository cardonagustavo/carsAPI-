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
    
    func makeUIViewController(context: Context) -> some UIViewController{
        CarsViewController.buildGrill()
//        CarsViewController.buildSimple()
    }
}

struct CarsViewPreview: PreviewProvider {
    static var previews: some View {
        CarsViewRepresentable()
    }
}
