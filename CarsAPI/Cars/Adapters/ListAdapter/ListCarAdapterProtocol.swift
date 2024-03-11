//
//  ListCarAdapterProtocol.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.
//

import UIKit

protocol ListCarAdapterProtocol {
    var datasource: [Any] { get set }
    
    func setCollectionView(_ collectionView: UICollectionView)
    func didSelectHandler(_ handler: @escaping (_ car: Car) -> Void )
}
