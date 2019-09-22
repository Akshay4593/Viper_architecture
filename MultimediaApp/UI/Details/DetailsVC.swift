//
//  DetailsVC.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var releasedDateLbl: UILabel!
    @IBOutlet weak var copyrightLbl: UILabel!
    
    var itemDetails: ItemDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Details"
        setUpUI()
        setData()
        setTheme()
    }

    private func setUpUI(){
        
        urlLbl.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(didTapUrlLabel))
        urlLbl.addGestureRecognizer(tap)
        tap.delegate = self
    }
    
    @objc func didTapUrlLabel(sender: UITapGestureRecognizer)
    {
        guard let url = URL(string: itemDetails?.url ?? "") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            DispatchQueue.main.async {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    private func setData(){
        guard let itemDetail = itemDetails else {
            return
        }
        urlLbl.text = "URL: \(itemDetail.url ?? "")"
        nameLbl.text = "Name: \(itemDetail.name?.capitalized ?? "")"
        typeLbl.text = "Kind: \(itemDetail.kind?.capitalized ?? "")"
        
        if let artist = itemDetail.artistName,
            artist.count > 0 {
            artistNameLbl.text = "Artist: \(artist)"
        }
        if let releasedDate = itemDetail.releaseDate,
            releasedDate.count > 0 {
            releasedDateLbl.text = "Released date: \(releasedDate)"
        }
        if let copyright = itemDetail.copyright,
            copyright.count > 0 {
            copyrightLbl.text = "copyright: \(copyright)"
        }
        
        imgView.downloaded(from: itemDetail.artworkUrl100 ?? "")
    }
    
    private func setTheme(){
        urlLbl.font = UIFont.themeRegularFont(of: 12)
        urlLbl.textColor = UIColor.blue
        
        nameLbl.font = UIFont.themeSemiBoldFont(of: 15)
        nameLbl.textColor = UIColor.black
        
        typeLbl.font = UIFont.themeMediumFont(of: 14)
        typeLbl.textColor = UIColor.black
        
        artistNameLbl.font = UIFont.themeMediumFont(of: 14)
        artistNameLbl.textColor = UIColor.black
        
        releasedDateLbl.font = UIFont.themeMediumFont(of: 12)
        releasedDateLbl.textColor = UIColor.black
        
        copyrightLbl.font = UIFont.themeLightFont(of: 11)
        copyrightLbl.textColor = UIColor.black
    }
    
}
