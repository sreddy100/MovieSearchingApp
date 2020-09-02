//
//  MovieSearcherTests.swift
//  MovieSearcherTests
//
//  Created by Sahil Reddy on 7/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import XCTest
import SwiftUI
@testable import MovieSearcher

class MovieSearcherTests: XCTestCase {
    let mvm = MovieViewModels()
    let dvm = DetailViewModels()
    var sut: URLSession!
    override func setUpWithError() throws {
        super.setUp()
         sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func testMVMData() {
        let movie = mvm.movies
        XCTAssertNotNil(movie.count)
    }
    
    func testMVMSearch() {
        XCTAssertNotNil(mvm.searchMovies(for: "Sully"))
    }
    
    func testMVMSearchEmpty() {
        XCTAssertNotNil(mvm.searchMovies(for: ""))
    }
    
    func testDVMDatePicker(){
        XCTAssertEqual(dvm.getDate(date: "2019-09-17"), "Sep 17, 2019")
    }
    
    func testBackdropImage() {
        let imageLoader = LoadImage()
        XCTAssertNotNil( MovieDetailImage(imageLoader: imageLoader, imageURL: "https://image.tmdb.org/t/p/w500/5L29r3uwDe49XDMaK2xDkDht9t0.jpg"))
    }
    
   func testValidCallToAPI() {
      
      let url =
        URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=ff40f379903bb37fc9d705201638bef1&page=1")
      
      let promise = expectation(description: "Status code: 200")

      
      let dataTask = sut.dataTask(with: url!) { data, response, error in
        
        if let error = error {
          XCTFail("Error: \(error.localizedDescription)")
          return
        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
          if statusCode == 200 {
            
            promise.fulfill()
          } else {
            XCTFail("Status code: \(statusCode)")
          }
        }
      }
      dataTask.resume()
      
      wait(for: [promise], timeout: 5)
    }
    


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
