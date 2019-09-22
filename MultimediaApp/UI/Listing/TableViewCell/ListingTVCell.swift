//
//  ListingTVCell.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit

class ListingTVCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTheme()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(item: ItemDetails) {
        
        titleLbl.text = item.name
        subTitleLbl.text = item.artistName
        //imgView.load(url: item.artworkUrl100 ?? "")
        imgView.downloaded(from: item.artworkUrl100 ?? "")

        
    }
    
    private func setTheme(){
        titleLbl.font = UIFont.themeSemiBoldFont(of: 14)
        titleLbl.textColor = UIColor.black
        subTitleLbl.font = UIFont.themeRegularFont(of: 12)
        subTitleLbl.textColor = UIColor.gray
    }

}
