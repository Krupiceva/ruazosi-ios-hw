import Foundation

class Movie {
    var id: Int
    var title: String
    var year: String
    var genre: Genre
    var description: String
    var image: URL
    var director: String
    
    init(id: Int, title: String, year: String, genre: Genre, description: String, image: URL, director: String) {
        self.id = id
        self.title = title
        self.year = year
        self.genre = genre
        self.description = description
        self.image = image
        self.director = director
    }
}



