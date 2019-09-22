//
//  HomeTVCell.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit

protocol HomeTVCellDelegate: class {
    
    func seeAllBtnTapped(itemDetails:[ItemDetails])
    func collectionViewCellDidSelect(item: ItemDetails)
}


class HomeTVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var seeAllBtn: UIButton!
    
    var itemsDetails: [ItemDetails]?
    
    var delegate: HomeTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
        setTheme()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUI(){
        
         collectionView.register(UINib(nibName: "HomeCVCell", bundle: nil), forCellWithReuseIdentifier: "HomeCVCell")
        
        let collectionViewFlowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewFlowLayout?.minimumLineSpacing = 16
        collectionViewFlowLayout?.minimumInteritemSpacing = 16
        collectionViewFlowLayout?.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    private func setTheme(){
        titleLbl.font = UIFont.themeBoldFont(of: 16)
        titleLbl.textColor = UIColor.black
        seeAllBtn.titleLabel?.font = UIFont.themeSemiBoldFont(of: 14)
        seeAllBtn.titleLabel?.textColor = UIColor.blue
        seeAllBtn.setTitleForAllStates("see all")
      
    
    }
    
    func setData(generalDetails: GeneralDetails) {
         let title = generalDetails.title
         titleLbl.text = title
         let items = generalDetails.results
         self.itemsDetails = items
        collectionView.reloadData()

    }
    
    
    @IBAction func seeAllBtnActn(_ sender: UIButton) {
        if delegate != nil {
            guard let itemDetails = itemsDetails else {
                return
            }
            delegate?.seeAllBtnTapped(itemDetails: itemDetails)
        }
    }
    

}
extension HomeTVCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsDetails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath) as! HomeCVCell
         if let items = itemsDetails {
            let item = items[indexPath.item]
            cell.setData(item: item, indexPath: indexPath)

        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize  {

        let itemHeight: CGFloat = collectionView.frame.height
        let itemWidth: CGFloat = (UIScreen.main.bounds.width - (3 * 16))/2.5
        let itemSize: CGSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
   
}
extension HomeTVCell : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil {
            guard let item = itemsDetails?[indexPath.item] else {
                return
            }
            delegate?.collectionViewCellDidSelect(item: item )
        }
    }
}
