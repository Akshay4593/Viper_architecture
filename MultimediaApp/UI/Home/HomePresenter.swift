//
//  HomePresenter.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter : HomePresenterProtocol {
 
    var view: HomeVCProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    
    var wireFrame: HomeWireframeProtocol?
    
    func viewDidLoad() {
        makeAllApiCalls()
    }
    
    func viewWillAppear() {
        
    }
    
    private func makeAllApiCalls(){

        makeMusicWebCall()
        makeMovieWebCall()
        makeTVShowWebCall()
        makeBooksWebCall()
    }
    
    func makeMovieWebCall(){
        view?.hideErrorView()
        view?.showLoading(message: "Loading...")
        interactor?.movieApiCall()
    }
    
    func makeMusicWebCall() {
        view?.hideErrorView()

        view?.showLoading(message: "Loading...")
        interactor?.musicApiCall()
    }
    
    func makeBooksWebCall() {
        view?.hideErrorView()

        view?.showLoading(message: "Loading...")
        interactor?.booksApiCall()
    }
    
    func makeTVShowWebCall() {
        view?.hideErrorView()
        view?.showLoading(message: "Loading...")
        interactor?.tvShowsApiCall()
    }
    
    func showDetailsScreen(itemDetail: ItemDetails) {
        wireFrame?.presentDetailsScreen(view: view!, itemDetail: itemDetail)
        
    }
    
    func showListingScreen(itemDetails: [ItemDetails]) {
        wireFrame?.presentListingScreen(view: view!, itemDetails: itemDetails)
    }
    
    
    
    
    
    
}
extension HomePresenter : HomeInteractorOutputProtocol {
    func onMovieDetailsSucess(response: ResponseModel) {
        view?.hideLoading()
        guard let generalDetails = response.feed else {
            return
        }
        view?.display(list: .movie(data: generalDetails))
        
    }
    
    func onMusicDetailsSucess(response: ResponseModel) {
        view?.hideLoading()

        guard let generalDetails = response.feed else {
            return
        }
        view?.display(list: .music(data: generalDetails))

        
    }
    
    func onBooksDetailsSucess(response: ResponseModel) {
        view?.hideLoading()

        guard let generalDetails = response.feed else {
            return
        }
        view?.display(list: .books(data: generalDetails))

    }
    
    func onTvShowsDetailsSucess(response: ResponseModel) {
        view?.hideLoading()
        guard let generalDetails = response.feed else {
            return
        }
        view?.display(list: .tvShows(data: generalDetails))
    }
    
    
    func onError(error: APIError) {
        view?.hideLoading()
        view?.showErrorView(type: .Custom(title: nil, desc: error.description, image: Image.icEmptyState.image, btnAction: "Retry"))
    }
    
    
}
