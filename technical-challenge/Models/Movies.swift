import ObjectMapper

public struct Movies: Mappable {
    public var search: [Search]?
    public var totalResults: String?
    public var response: String?
    public var error: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        search         <- map["Search"]
        totalResults   <- map["totalResults"]
        response       <- map["Response"]
        error          <- map["Error"]
    }
}

public struct Search: Mappable, Hashable {
    public var title: String?
    public var year: String?
    public var imdbID: String?
    public var type: String?
    public var poster: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        title    <- map["Title"]
        year     <- map["Year"]
        imdbID   <- map["imdbID"]
        type     <- map["Type"]
        poster   <- map["Poster"]
    }
}
