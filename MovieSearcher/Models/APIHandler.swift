//
//  APICall.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI

class APIHandler{
    static let shared = APIHandler()
    
    func getAllMovies(pageNum: String, completion: @escaping ([Result])->()) {
        
        let urlString = MoviesURL.PopularUrl + pageNum
        
        guard let url = URL(string: urlString ) else{
            fatalError("URL is not correct!")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {return}
            
            
                let movies = try! JSONDecoder().decode(MovieModels.self, from: data)
                
                var movieArr = [Result]()
                for i in movies.results{
                    movieArr.append(i)
                }
                completion(movieArr)
                    
                
            
        }.resume()
    }
    
    func getSearchedMovies(text: String, completion: @escaping ([Result])->()) {
        
        let newText = String(text.filter { !" ".contains($0) })
        
        let urlString = MoviesURL.SearchUrl + newText
        print("UrlString: \(urlString)" )
        guard let url = URL(string: urlString ) else{
            print("no movie")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {return}
            
            
                let movies = try! JSONDecoder().decode(MovieModels.self, from: data)
                
                var movieArr = [Result]()
                for i in movies.results{
                    movieArr.append(i)
                }
                completion(movieArr)
                    
                
            
        }.resume()
    }
}
