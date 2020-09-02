import Foundation

struct MoviesURL {

    struct Domains {
        static let BaseUrl = "https://api.themoviedb.org/3"
        static let Search = "/search/movie"
        static let Movie = "/movie/"
        static let Popular = "/movie/popular"
        static let Page = "&page="
        static let Query = "&query="
        static let ApiKey = "?api_key=ff40f379903bb37fc9d705201638bef1"
        static let Poster = "https://image.tmdb.org/t/p/w342"
        static let Backdrop = "https://image.tmdb.org/t/p/w500"
    }
//https://api.themoviedb.org/3/movie/popular?api_key=ff40f379903bb37fc9d705201638bef1&page=1
    static let PopularUrl = Domains.BaseUrl + Domains.Popular + Domains.ApiKey + Domains.Page
    static let SearchUrl = Domains.BaseUrl + Domains.Search + Domains.ApiKey + Domains.Query
//https://api.themoviedb.org/3/search/movie?api_key=ff40f379903bb37fc9d705201638bef1&query=
    ///phWZP5FESItyhQcqk6sWz35nUtP.jpg backdrop
    ///5L29r3uwDe49XDMaK2xDkDht9t0.jpg post
}

struct Images {
    static let DefaultImage = "default-movie"
    static let BackGroundImage = "lunch-background"
}

struct JsonFile {
    static let GenresJsonFile = "genresData"
}


