import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.errorText.isEmpty {
                AsyncImage(url: URL(string: viewModel.poster)) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            ScrollView {
                                VStack(alignment: .leading, spacing: 24) {
                                    Text("\(viewModel.title) (\(viewModel.releaseYear))")
                                        .font(.system(size: 32).bold())
                                    
                                    HStack {
                                        Spacer()
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        Spacer()
                                    } //: HSTACK
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(viewModel.plotLabel)
                                            .bold()
                                        Text(viewModel.longPlot)
                                    } //: VSTACK
                                    
                                    HStack(alignment: .top) {
                                        Text(viewModel.languageLabel)
                                            .bold()
                                        Text(viewModel.languages)
                                    } //: HSTACK
                                    
                                    HStack(alignment: .top) {
                                        Text(viewModel.actorLabel)
                                            .bold()
                                        Text(viewModel.actors)
                                    } //: HSTACK
                                    
                                    HStack(alignment: .top) {
                                        Text(viewModel.durationLabel)
                                            .bold()
                                        Text(viewModel.duration)
                                    } //: HSTACK
                                    
                                    Spacer()
                                } //: VSTACK
                                .padding(.horizontal, 18)
                            } //: SCROLLVIEW
                        case .failure:
                            Text(viewModel.errorMessage)
                        @unknown default:
                            Text(viewModel.defaultMessage)
                    }
                } //: ASYNCIMAGE
                .navigationBarTitle("", displayMode: .inline)
            } else {
                Text(viewModel.errorText)
                    .bold()
            }
        } //: VSTACK
        .onAppear {
            viewModel.fetchMovieDetails()
        }
    }
}
