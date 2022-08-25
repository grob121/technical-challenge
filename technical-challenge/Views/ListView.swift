import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.errorText.isEmpty {
                    ForEach(viewModel.searchedMovies, id: \.self) { movie in
                        NavigationLink(destination: DetailView(viewModel: .init(imdbID: movie.imdbID ?? ""))) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(movie.title ?? "")
                                    .bold()
                                Text(movie.year ?? "")
                            } //: VSTACK
                        } //: NAVIGATIONLINK
                    } //: FOREACH
                } else {
                    Text(viewModel.errorText)
                        .bold()
                }
            } //: LIST
            .searchable(text: $viewModel.searchText)
            .navigationTitle(viewModel.listNavTitle)
        } //: NAVIGATIONVIEW
        .accentColor(.black)
        .onAppear {
            viewModel.fetchMovies()
        }
        .onChange(of: viewModel.searchText) { _ in
            viewModel.fetchMovies()
        }
    }
}
