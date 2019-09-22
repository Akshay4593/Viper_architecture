//
//  HomeCVCell.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit

class HomeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTheme()
    }

    func setData(item: ItemDetails,  indexPath: IndexPath?){
        itemNameLbl.text = item.name
        //imgView.load(url: item.artworkUrl100 ?? "", indexPath: indexPath)
        imgView.downloaded(from: item.artworkUrl100 ?? "")
    }
    
    private func setTheme(){
        itemNameLbl.font = UIFont.themeSemiBoldFont(of: 14)
        itemNameLbl.textColor = UIColor.black
    }
    
}
