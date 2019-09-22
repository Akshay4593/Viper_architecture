//
//  HomeProtocols.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation
import UIKit

protocol HomeWireframeProtocol: class {
    static func createHomeModule() -> UIViewController
    
    func presentDetailsScreen(view: HomeVCProtocol, itemDetail: ItemDetails)
    func presentListingScreen(view: HomeVCProtocol, itemDetails: [ItemDetails])
}

protocol HomeVCProtocol : BaseView {
    
    var presenter: HomePresenterProtocol? { get set }
    
    func display(list:TypeOfList)

    
}
protocol HomePresenterProtocol: BasePresenter {
    var view: HomeVCProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireframeProtocol? { get set }
    
    func makeMovieWebCall()
    func makeMusicWebCall()
    func makeBooksWebCall()
    func makeTVShowWebCall()
    
    func showDetailsScreen(itemDetail: ItemDetails)
    func showListingScreen(itemDetails: [ItemDetails])
}

protocol HomeInteractorInputProtocol: class {
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    func movieApiCall()
    func musicApiCall()
    func booksApiCall()
    func tvShowsApiCall()
}

protocol HomeInteractorOutputProtocol {
    
    func onMovieDetailsSucess(response: ResponseModel)
    func onMusicDetailsSucess(response: ResponseModel)
    func onBooksDetailsSucess(response: ResponseModel)
    func onTvShowsDetailsSucess(response: ResponseModel)

    func onError(error: APIError)
}
