//
//  TeamVC.swift
//  NetworLayer
//
//  Created by Shamkhal on 5/12/20.
//

import UIKit

class TeamVC: UIViewController {

    @IBOutlet var teamCollection: UICollectionView!
    
    var vm = TeamVM()
    let cellIdentifier = "TeamCell"
    var dataSource: CollectionViewDataSource<TeamCell, TeamData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProgress()
        vm.getAllTeams(success: { teamData in
            self.dismissProgress()
            self.dataSource = CollectionViewDataSource(cellId: self.cellIdentifier, items: teamData, configCell: { (cell, model, index) in
                cell.teamName.text = model.abbreviation
                cell.teamImage.image = UIImage(named: model.abbreviation ?? "")
            })
            self.teamCollection.dataSource = self.dataSource
        }) { errorMessage in
            self.dismissProgress()
            self.alert(title: "Error", message: errorMessage.message ?? "", actionButton: "Close")
        }
    }
}

extension TeamVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 16*3)/2, height: 160)
    }
}
