import Foundation

class DetailViewModel: ObservableObject {
    private var imdbID: String
    let plotLabel = MovieDetail.plotLabel
    let languageLabel = MovieDetail.languageLabel
    let actorLabel = MovieDetail.actorLabel
    let durationLabel = MovieDetail.durationLabel
    let errorMessage = MovieDetail.errorMessage
    let defaultMessage = MovieDetail.defaultMessage
    @Published var title = ""
    @Published var releaseYear = ""
    @Published var poster = ""
    @Published var longPlot = ""
    @Published var languages = ""
    @Published var actors = ""
    @Published var duration = ""
    @Published var errorText = ""
    @Published var isLoading = true
    private let omdbService = OMDbService()
    
    public init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func fetchMovieDetails() {
        omdbService.getMovie(query: imdbID) { [unowned self] (callback) in
            isLoading = false
            switch callback{
                case .success(let response):
                    title = response.title ?? ""
                    releaseYear = response.year ?? ""
                    poster = response.poster ?? ""
                    longPlot = response.plot ?? ""
                    languages = response.language ?? ""
                    actors = response.actors ?? ""
                    duration = response.runtime ?? ""
                case .failure(let error):
                    errorText = error.localizedDescription
            }
        }
    }
}
