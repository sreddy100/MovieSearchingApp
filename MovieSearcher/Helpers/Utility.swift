//
//  Utility.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI

class UtilHelper {
    
    func correctDate(newDate: String) -> String {
        let dateString = newDate //"Thu, 22 Oct 2015 07:45:17 +0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale.init(identifier: "en_GB")

        guard let dateObj = dateFormatter.date(from: dateString) else {
            return newDate
        }
//"2019-09-17"
        dateFormatter.dateFormat = "MMM d, yyyy"
        print("Dateobj: \(dateFormatter.string(from: dateObj))")
        
        return dateFormatter.string(from: dateObj)
    }
    
    func DoubleToString(num: Double?) -> String{
        guard let num = num else {
            return "N/A"
        }
        let c:String = String(format:"%.1f", num)
        return c
    }
    
    func RatingToStars(num: Double?) -> Image{
        guard let num = num else {
            return Image("0star")
        }
        var star = "0star"
        if num == 10.0 {
            star = "10star"
        }else if (num >= 8.5 && num < 10){
            star = "9star"
        }else if (num >= 7.5 && num < 8.5){
            star = "8star"
        }else if (num >= 6.5 && num < 7.5){
            star = "7star"
        }else if (num >= 5.5 && num < 6.5){
            star = "6star"
        }else if (num >= 4.5 && num < 5.5){
            star = "5star"
        }else if (num >= 3.5 && num < 4.5){
            star = "4star"
        }else if (num >= 2.5 && num < 3.5){
            star = "3star"
        }else if (num >= 1.5 && num < 2.5){
            star = "2star"
        }else if (num >= 0.5 && num < 1.5){
           star = "1star"
        }
        
        return Image(star)
    }


}
