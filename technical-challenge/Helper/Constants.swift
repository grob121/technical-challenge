import Foundation

struct Router {
    static let baseUrl = "http://www.omdbapi.com/"
    
    struct Endpoints {
        static let searchMovies = "?s=%@&apikey=5b04d0e"
        static let getMovie = "?i=%@&apikey=5b04d0e"
    }
}

struct MovieList {
    static let navigationTitle = "Movies"
    static let initialSearch = "the a"
}

struct MovieDetail {
    static let plotLabel = "Plot:"
    static let languageLabel = "Language(s):"
    static let actorLabel = "Actor(s):"
    static let durationLabel = "Duration:"
    static let errorMessage = "Failed fetching data. Please try again."
    static let defaultMessage = "Unknown error. Please try again."
}
