import Foundation

class ListViewModel: ObservableObject {
    let listNavTitle = MovieList.navigationTitle
    private let initialSearchText = MovieList.initialSearch
    @Published var searchText = ""
    @Published var searchedMovies: [Search] = []
    @Published var errorText = ""
    private let omdbService = OMDbService()
    
    func fetchMovies() {
        omdbService.searchMovies(query: searchText.isEmpty ? initialSearchText : searchText) { [unowned self] (callback) in
            switch callback{
                case .success(let response):
                    guard let error = response.error, !error.isEmpty else {
                        errorText = ""
                        searchedMovies = response.search ?? []
                        return
                    }
                    errorText = error
                case .failure(let error):
                    errorText = error.localizedDescription
            }
        }
    }
}
