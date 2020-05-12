//
//  CollectionViewDataSource.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import UIKit
import Foundation

class CollectionViewDataSource <Cell: UICollectionViewCell, ViewModel>: NSObject, UICollectionViewDataSource {
    private var header: String?
    private var footer: String?
    private var cellId: String?
    private var arrItem: [ViewModel]?
    var configureCell: (Cell, ViewModel, Int) -> ()
    
    init(cellId: String, items: [ViewModel], configCell: @escaping(Cell, ViewModel, Int)->()) {
        self.cellId = cellId
        self.arrItem = items        
        self.configureCell = configCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrItem?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId!, for: indexPath) as! Cell
        configureCell(cell, arrItem![indexPath.item], indexPath.item)
        
        return cell
    }    
}
