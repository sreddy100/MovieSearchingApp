//
//  DetailViewModel.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class DetailViewModels: ObservableObject {
    
    func getDate(date: String) -> String {
        let utilHelper = UtilHelper()
        let dateF = utilHelper.correctDate(newDate: date)
        return dateF
    }
    

}

