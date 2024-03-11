//
//  ErrorCollectionViewCell.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 8/03/24.
//

import UIKit

class ErrorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var labelMessage: UILabel!
    
    fileprivate func updateDataWith(_ text: String) {
        self.labelMessage.text = text
    }
}

extension ErrorCollectionViewCell {
    
    class var identifier: String { "ErrorCollectionViewCell" }
    /*
     This line declares a class property identifier of type
     String.
     The value assigned to identifier is
     "CarsCollectionViewCell", which likely serves as the reuse
     identifier for dequeuing cells in a UICollectionView.
     */
    
    class func buildIN(_ collectionView: UICollectionView, in indexPath: IndexPath, with text: String) -> Self {
        
        //            let car = self.datasource[indexPath.item]
        //        print(car)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? Self
        cell?.updateDataWith(text)
        //            cell?.updateDataWith(self.datasource[indexPath.item])
        return cell ?? Self()
        
    }
    /*
     This is a class method (class func) named buildIN.
     It's used to create and configure instances of
     CarsCollectionViewCell.
     
     Parameters:
     collectionView: The UICollectionView from which the cell
     will be dequeued.
     indexPath: The IndexPath indicating the location of the cell
     within the collection view.
     car: An instance of Car that contains the data to be
     displayed in the cell.
     
     Inside the method:
     It dequeues a reusable cell from the collection view using
     the provided collectionView and indexPath. The reuse
     identifier used is obtained from the identifier property of
     the class.
     
     The dequeued cell is cast to the type of the class (Self)
     using as? Self. This ensures type safety when working with
     subclasses of CarsCollectionViewCell.
     
     The updateDataWith method of the cell is called, passing the
     car object as an argument to update its data.
     
     Finally, it returns the dequeued cell. If the cell is nil
     (i.e., dequeuing fails), it returns a new instance of
     CarsCollectionViewCell by calling Self(). This provides a
     fallback mechanism to ensure that a cell is always returned.
     */
}
