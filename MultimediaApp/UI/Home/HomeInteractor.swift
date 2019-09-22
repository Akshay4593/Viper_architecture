//
//  HomeInteractor.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 24/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation

class HomeInteractor : HomeInteractorInputProtocol {

    
    var presenter: HomeInteractorOutputProtocol?
    
    
    func movieApiCall(){
        MovieRequest().response(completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onMovieDetailsSucess(response: response)
                break
            case .failure(let error):
                self?.presenter?.onError(error: error)
                break
            }
        })
    }
    
    func musicApiCall() {
        MusicRequest().response(completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onMusicDetailsSucess(response: response)
                break
            case .failure(let error):
                self?.presenter?.onError(error: error)
                break
            }
        })
    }
    
    func booksApiCall() {
        BooksRequest().response(completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onBooksDetailsSucess(response: response)
                break
            case .failure(let error):
                self?.presenter?.onError(error: error)
                break
            }
        })
    }
    
    func tvShowsApiCall() {
        TVShowsRequest().response(completion: { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.presenter?.onTvShowsDetailsSucess(response: response)
                break
            case .failure(let error):
                self?.presenter?.onError(error: error)
                break
            }
        })
    }
    
}

