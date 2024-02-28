//  CarsView.swift
//  CarsAPI
//  Created by Gustavo Adolfo Cardona Quintero on 23/02/24.

import UIKit

protocol CarsViewDelegate: AnyObject {
    func carsView(_ carsView: CarsView, didSelectCar car: Car)
}

class CarsView: UIView {
    
    @IBOutlet private weak var clvCars: UICollectionView!
    weak var delegate: CarsViewDelegate?
    
    var listAdapter: ListCarAdapterProtocol = ListCarAdapter()
    /*
     Ratio: "Image ratio" usually refers to the proportional relationship between the width and height of an image. It describes how many times wider an image is compared to its height or vice versa. For example, an image with a ratio of 4:3 means that its width is 4 units for every 3 units of height.
     - When you're displaying images in a UICollectionView, you might want to maintain the aspect ratio of the images so they don't appear stretched or distorted. This means ensuring that the width-to-height ratio of each image remains the same as the original image.
     */
    
    //    var datasource = [Car]() {
    //        didSet {
    //            self.clvCars.reloadData()
    
    func setupAdapters() {
        self.listAdapter.setCollectionView(self.clvCars)
        
        self.listAdapter.didSelectHandler {car in
        self.delegate?.carsView(self, didSelectCar: car)
        }
    }
    
    func reloadData(_ datasource: [Car]) {
        self.listAdapter.datasource = datasource
        self.clvCars.reloadData()
    }
}


        /*
        -  This line creates a variable called datasource, which holds an array of Car objects.
        -  Whenever the datasource array changes (like adding, removing, or modifying items), the code inside the {} block gets executed.
        -  Inside this block, self.clvCars.reloadData() is called. This function tells a collection view (clvCars) to refresh its data to reflect any changes in the datasource.
         
        -  is an a bad implementation becasuse when dos you need modify de array can be it generate an error, for practically moment this implementation put here but it will be moved to adapter.
         
         didSet {
             self.clvCars.reloadData()
         }
         */
//    }
    
//    func setList() {
//        self.clvCars.dataSource = self
//        self.clvCars.delegate = self
//    }
    /*
     This function, setList(), is responsible for configuring a collection view (clvCars).
     It sets two important properties of the collection view:
     dataSource: This property tells the collection view where to get its data from. By setting it to self, the current class is saying, "I'll provide the data."
     delegate: This property is responsible for handling interactions and layout of the collection view. Again, by setting it to self, the current class is saying, "I'll handle those tasks."
     */




