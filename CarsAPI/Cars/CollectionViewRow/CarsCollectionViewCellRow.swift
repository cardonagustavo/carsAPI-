//
//  CarsCollectionViewRow.swift
//  CarsAPI
//
//  Created by Gustavo Adolfo Cardona Quintero on 6/03/24.
//
import UIKit

class CarsCollectionViewCellRow: UICollectionViewCell {
    
    @IBOutlet weak var imgMoviesRow: UIImageView!
    @IBOutlet weak var LabelNameMoviesRow: UILabel!
    @IBOutlet weak var LabelRealiseYearRow: UILabel!
    
    fileprivate func updateDataWith(_ car: Car) {
            self.LabelNameMoviesRow.text = car.fullName
            self.LabelRealiseYearRow.text = car.realeaseYear
        }
}
    /*
     A "builder" is a software design pattern used to construct
     complex objects step by step. It allows for the creation of
     objects composed of parts, where each part can be configured
     independently before being assembled into the final object.
     
     In the context of your code, the buildIN method acts as a
     "builder". It takes the necessary parameters to construct an
     instance of CarsCollectionViewCell (such as the
     collectionView, indexPath, and car) and returns a cell
     configured with the provided information. This method
     abstracts the logic of building and configuring the cell,
     making it easier to reuse and maintain in different parts of
     the code. */
extension CarsCollectionViewCellRow {
    
    class var identifier: String { "CarsCollectionViewCellRow" }
    /*
     This line declares a class property identifier of type
     String.
     The value assigned to identifier is
     "CarsCollectionViewCell", which likely serves as the reuse
     identifier for dequeuing cells in a UICollectionView.
     */
    
    class func buildIN(_ collectionView: UICollectionView, in indexPath: IndexPath, with car: Car) -> CarsCollectionViewCellRow {
        
        //            let car = self.datasource[indexPath.item]
        //        print(car)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath) as? CarsCollectionViewCellRow
        cell?.updateDataWith(car)
        //            cell?.updateDataWith(self.datasource[indexPath.item])
        return cell ?? CarsCollectionViewCellRow()
        
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
