//
//  HomeVC.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit


enum TypeOfList{
    
    case music(data: GeneralDetails)
    case movie(data: GeneralDetails)
    case tvShows(data: GeneralDetails)
    case books(data: GeneralDetails)

}

class HomeVC: BaseUIViewController {
    
    var presenter: HomePresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    private var movieDetails: GeneralDetails?
    private var musicDetails: GeneralDetails?
    private var tvShowsDetails: GeneralDetails?
    private var booksDetails: GeneralDetails?
    
    private var displayData: [TypeOfList] = []

    //MARK: - UIViewControllers Life Cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    //MARK: - Set Up UI methods
    override internal func setUI(){
        title = "Home"
        tableView.register(UINib(nibName: "HomeTVCell", bundle: nil), forCellReuseIdentifier: "HomeTVCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 280
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    

}

//MARK: - UITableViewDataSource methods
extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVCell", for: indexPath) as! HomeTVCell
        
            cell.delegate = self
            
            switch  displayData[indexPath.row] {
            case .music(let data):
                cell.setData(generalDetails: data)
                
            case .movie(let data):
                cell.setData(generalDetails: data)
                
            case .tvShows(let data):
                cell.setData(generalDetails: data)
                
            case .books(let data):
                cell.setData(generalDetails: data)
            }
  
        return cell
    }
    
}

//MARK: - UITableViewDelegate methods
extension HomeVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
}
//MARK: - HomeVCProtocol methods
extension HomeVC : HomeVCProtocol {
    
    func display(list: TypeOfList) {
        self.displayData.append(list)
        tableView.reloadData()
    }
    
    func showErrorView(type: EmptyErrorType) {
        self.showError(type: type, delegate: self )
    }
    
    func hideErrorView() {
        hideLoadingView()
    }
    
}
//MARK: - HomeTVCellDelegate (Actions from TVcell) methods
extension HomeVC : HomeTVCellDelegate {
    func collectionViewCellDidSelect(item: ItemDetails) {
        
      presenter?.showDetailsScreen(itemDetail: item)
    }
    
    
    func seeAllBtnTapped(itemDetails: [ItemDetails]) {
        presenter?.showListingScreen(itemDetails: itemDetails)
    }
    
}
//MARK: - Error View methods
extension HomeVC : SNEmptyStateViewDelegate {
    
    func retryBtnTapped() {
        hideError()
        self.displayData.removeAll()
        presenter?.viewDidLoad()
    }    
    
}
