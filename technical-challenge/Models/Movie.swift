import ObjectMapper

public struct Movie: Mappable {
    public var title: String?
    public var year: String?
    public var rated: String?
    public var released: String?
    public var runtime: String?
    public var genre: String?
    public var director: String?
    public var writer: String?
    public var actors: String?
    public var plot: String?
    public var language: String?
    public var country: String?
    public var awards: String?
    public var poster: String?
    public var ratings: [Rating]?
    public var metascore: String?
    public var imdbRating: String?
    public var imdbVotes: String?
    public var imdbID: String?
    public var type: String?
    public var dvd: String?
    public var boxOffice: String?
    public var production: String?
    public var website: String?
    public var response: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        title        <- map["Title"]
        year         <- map["Year"]
        rated        <- map["Rated"]
        released     <- map["Released"]
        runtime      <- map["Runtime"]
        genre        <- map["Genre"]
        director     <- map["Director"]
        writer       <- map["Writer"]
        actors       <- map["Actors"]
        plot         <- map["Plot"]
        language     <- map["Language"]
        country      <- map["Country"]
        awards       <- map["Awards"]
        poster       <- map["Poster"]
        ratings      <- map["Ratings"]
        metascore    <- map["Metascore"]
        imdbRating   <- map["imdbRating"]
        imdbVotes    <- map["imdbVotes"]
        imdbID       <- map["imdbID"]
        type         <- map["Type"]
        dvd          <- map["DVD"]
        boxOffice    <- map["BoxOffice"]
        production   <- map["Production"]
        website      <- map["Website"]
        response     <- map["Response"]
    }
}

public struct Rating: Mappable {
    public var source: String?
    public var value: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        source   <- map["Source"]
        value    <- map["Value"]
    }
}
