//
//  ListingVC.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit

class ListingVC: BaseUIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var itemDetails: [ItemDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    
    override internal func setUI(){
        super.setUI()
        title = "Listing"

        tableView.register(UINib(nibName: "ListingTVCell", bundle: nil), forCellReuseIdentifier: "ListingTVCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}
extension ListingVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTVCell", for: indexPath) as! ListingTVCell
        cell.setData(item: itemDetails[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    
}
extension ListingVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemDetails[indexPath.row]
        let viewController = UIStoryboard(name: "Home", bundle: nil)
            .instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        viewController.itemDetails = item
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
