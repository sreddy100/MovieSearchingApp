//
//  EnvironmentValues+ImageCache.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/4/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey {
   
    
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
