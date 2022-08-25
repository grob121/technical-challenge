import Alamofire
import AlamofireObjectMapper

class OMDbService {
    func searchMovies(query: String, callback: @escaping (Swift.Result<Movies, Error>) -> Void) {
        let allowedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        Alamofire.request(
            Router.baseUrl + String(format: Router.Endpoints.searchMovies, allowedQuery),
            method: .get,
            encoding: URLEncoding.queryString)
            .responseObject { (response: DataResponse<Movies>) in
            switch response.result {
                case .success(let value):
                    callback(.success(value))
                case .failure(let error):
                    callback(.failure(error))
            }
        }
    }
    
    func getMovie(query: String, callback: @escaping (Swift.Result<Movie, Error>) -> Void) {
        let allowedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        Alamofire.request(
            Router.baseUrl + String(format: Router.Endpoints.getMovie, allowedQuery),
            method: .get,
            encoding: URLEncoding.queryString)
            .responseObject { (response: DataResponse<Movie>) in
            switch response.result {
                case .success(let value):
                    callback(.success(value))
                case .failure(let error):
                    callback(.failure(error))
            }
        }
    }
}
