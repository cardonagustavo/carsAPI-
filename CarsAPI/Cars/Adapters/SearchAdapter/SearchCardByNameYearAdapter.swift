//
//  SearchCardByNameYearAdapter.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 8/03/24.
//

import UIKit

class SearchCardByNameYearAdapter: NSObject, SearchCarAdapterProtocol {
     
    var datasource: [Car] = []
    private var didFilter: ((_ cars: [Car]) -> Void)?
    
    func setSearchBar(_ searchBar: UISearchBar) {
        searchBar.delegate = self
    }
    
    func didFilterHandler(_ handler: @escaping ([Car]) -> Void) {
        self.didFilter = handler
    }
    
    
}


extension SearchCardByNameYearAdapter: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var arrayResulrt: [Car] = []
        let searchTextLowercased = searchText.lowercased()
        
        if searchTextLowercased.isEmpty {
            arrayResulrt = self.datasource
        } else {
            arrayResulrt = self.datasource.filter({
                return $0.fullName.lowercased().contains(searchText.lowercased()) || $0.realeaseYear.contains(searchTextLowercased)
                
            })
            self.didFilter?(arrayResulrt)
        }
    }
}

