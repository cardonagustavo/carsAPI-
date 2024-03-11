//
//  SearchAdapter.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 8/03/24.
//

import UIKit

protocol SearchCarAdapterProtocol: AnyObject {
    var datasource: [Car] { get set }
    func setSearchBar(_ searchBar: UISearchBar)
    func didFilterHandler(_ handler: @escaping (_ result: [Any]) -> Void )
}
 
