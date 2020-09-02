//
//  MovieDetailView.swift
//  MovieSearcher
//
//  Created by Sahil Reddy on 7/3/20.
//  Copyright © 2020 Sahil Reddy. All rights reserved.
//

import SwiftUI

struct MovieDetailRow: View {
    var details: Result

    var util = UtilHelper()
    
    var body: some View {
        VStack{
            Spacer()
            Text(details.title ?? "").font(.system(size: 24))
            Spacer()
            Text("Rating: \(util.DoubleToString(num: details.voteAverage)) / 10")
//            util.RatingToStars(num: details.voteAverage).frame(minWidth: 5, idealWidth: 10, maxWidth: 10, minHeight: 5, idealHeight: 5, maxHeight: 5, alignment: .center)
            Spacer()
        }
        
    }
}

struct MovieDetailView: View {
    @State var detailModel = DetailViewModels()
    
    var movie : Result?
    let imageLoader = LoadImage()
    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ScrollView{
            VStack{
                
                    MovieDetailImage(imageLoader: imageLoader, imageURL: MoviesURL.Domains.Backdrop + (movie?.backdropPath ?? ""))

                
                
                HStack{
                    Text(movie?.title ?? "Title").bold().font(.system(size: 24))
                    Spacer()
                    Text("Rating: \(String(format:"%.1f", movie?.voteAverage as! CVarArg) ?? "N/A")" ).padding() //
                }
                Group{
                    HStack{
                        Text("Release Date: \(detailModel.getDate(date: movie?.releaseDate ?? ""))" )
                        Spacer()
                        Text("Language: \(movie?.originalLanguage ?? "N/A")")
                    }
                }.padding(.bottom)
                
                
                HStack{
                    Text("Overview: \(movie?.overview ?? "N/A")")
                    Spacer()
                }.padding(.top)
                }.padding()
            }
        }.navigationBarTitle("Movie Details", displayMode: .inline)
    
        
    }
    
    

}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: nil)
    }
}


struct MovieDetailImage: View {
    
    @ObservedObject var imageLoader: LoadImage
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
