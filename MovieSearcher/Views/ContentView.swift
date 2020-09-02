//
//  ContentView.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/2/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var model = MovieViewModels()    
    @State private var search = ""
    let cellHeight = UIScreen.main.bounds.height / 3
    let loadImage = LoadImage()
    @Environment(\.imageCache) var cache: ImageCache

    var body: some View {
        NavigationView {
            VStack{
                SearchBar(text: $search, onTextChanged: model.searchMovies)
                
                List(model.movies.filter{self.search.isEmpty ? true : $0.title?.localizedCaseInsensitiveContains(self.search) as! Bool}, id: \.self) { movie in

                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        HStack{
                            AsyncImage(
                                url: URL(string: MoviesURL.Domains.Poster + (movie.posterPath ?? ""))!,
                               cache: self.cache,
                               placeholder: Image("Placeholder"),
                               configuration: {
                                $0.resizable() }
                            ).frame(width: 150.0, height: self.cellHeight - 20)
                            
                            Spacer().frame(width: 10, height: 0)
                            
                            MovieDetailRow(details: movie)
                            
                            
                        }
                        
                    }
                   
                }.environment(\.defaultMinListRowHeight, cellHeight)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                    
            }
        }.navigationBarTitle("Select a Movie", displayMode: .inline)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}


struct MovieDetailImageS: View {
    
    var imageLoader: LoadImage
    let imageURL: String
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

extension Image {
    func myImageModifier() -> some View {
        self
            .resizable()
            .frame(width: 32.0, height: 32.0, alignment: .leading)
            .aspectRatio(1.0, contentMode: .fit)
            
   }
}

