//
//  SearchCardByNameYearAdapter.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 8/03/24.
//

import UIKit

class SearchCardByNameYearAdapter: NSObject, SearchCarAdapterProtocol {
     
    var datasource: [Car] = []
    private var didFilter: ((_ result : [Any]) -> Void)?
    
    func setSearchBar(_ searchBar: UISearchBar) {
        searchBar.delegate = self
    }
    
    func didFilterHandler(_ handler: @escaping ([Any]) -> Void) {
        self.didFilter = handler
    }
}


extension SearchCardByNameYearAdapter: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var arrayResult: [Any] = []
        let searchTextLowercased = searchText.lowercased()
        
        if searchTextLowercased.isEmpty {
            arrayResult = self.datasource
        } else {
            arrayResult = self.datasource.filter({
                return $0.fullName.lowercased().contains(searchText.lowercased()) || $0.realeaseYear.contains(searchTextLowercased)
                
            })
            
            arrayResult = !arrayResult.isEmpty ? arrayResult : ["""
            No se encontraron resultados para la busqueda de:
            
            \(searchText)
            """]
        }
        self.didFilter?(arrayResult)
    }
}

