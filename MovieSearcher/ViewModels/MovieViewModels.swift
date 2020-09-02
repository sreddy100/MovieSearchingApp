//
//  MovieViewModels.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class MovieViewModels: ObservableObject {
    init() {
        getData()
    }
    var pageNum = 0

    @Published var movies = [Result]()
    
    func isLastElement(movie: Result)->Bool {
        if movie == movies[-1] {
            return true
        }
        return false
    }
    
    func getData() {
        APIHandler.shared.getAllMovies(pageNum: "") {
//            self.movies.removeAll()
            self.movies = $0
        }

    }
    func getPagedData() {
        if pageNum == 0 {
            APIHandler.shared.getAllMovies(pageNum: "") {
                self.movies = $0
            }

        }else{
            pageNum += 1
            APIHandler.shared.getAllMovies(pageNum: "") {
                let tempArr = $0
                self.movies += tempArr
            }
        }
        
    }
    
    func callSearchedData(text: String) {
        pageNum = 0
        APIHandler.shared.getSearchedMovies(text: text) { (result) in
            self.movies.removeAll()
            self.movies = result
            print(self.movies)
        }
    }
    
    func searchMovies(for searchText: String) {
        if !searchText.isEmpty {
            callSearchedData(text: searchText)
        } else {
            // remove search result when a user clear keyword.
            getData()
        }
    }
    
}
