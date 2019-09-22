//
//  HomeWireframe.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation
import UIKit

class HomeWireframe : HomeWireframeProtocol {
  
    static func createHomeModule() -> UIViewController {
        
        let vc = UIStoryboard(name: "Home", bundle: nil)
            .instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let wireFrame: HomeWireframeProtocol = HomeWireframe()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        interactor.presenter = presenter
        
        return vc
        
    }
    
    func presentDetailsScreen(view: HomeVCProtocol, itemDetail: ItemDetails) {
        
        if let sourceVC = view as? UIViewController {
            let viewController = UIStoryboard(name: "Home", bundle: nil)
                .instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
            viewController.itemDetails = itemDetail
            sourceVC.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func presentListingScreen(view: HomeVCProtocol, itemDetails: [ItemDetails]) {
        if let sourceVC = view as? UIViewController {
            let viewController = UIStoryboard(name: "Home", bundle: nil)
                .instantiateViewController(withIdentifier: "ListingVC") as! ListingVC
            viewController.itemDetails = itemDetails
            sourceVC.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    
    
}
