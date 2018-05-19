import Foundation
class MovieDataBase {
    static var database = MovieDataBase()
    private let listOfMovies: [Movie] = [
        Movie(id: 1, title: "Star Wars: Episode IV – A New Hope", year: "1977", genre: .sciFi, description: "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle-station while also attempting to rescue Princess Leia from the evil Darth Vader.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,643,1000_AL_.jpg")!, director: "George Lucas"),
        Movie(id: 2, title: "Star Wars: Episode V - The Empire Strikes Back", year: "1980", genre: .sciFi, description: "After the rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued by Darth Vader.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,641,1000_AL_.jpg")!, director: "Irvin Kershner"),
        Movie(id: 3, title: "Star Wars: Episode VI - Return of the Jedi", year: "1983", genre: .sciFi, description: "After a daring mission to rescue Han Solo from Jabba the Hutt, the rebels dispatch to Endor to destroy a more powerful Death Star. Meanwhile, Luke struggles to help Vader back from the dark side without falling into the Emperor's trap.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SY999_CR0,0,644,999_AL_.jpg")!, director: "Richard Marquand"),
        Movie(id: 4, title: "Star Wars: Episode I - The Phantom Menace", year: "1999", genre: .sciFi, description: "Two Jedi Knights escape a hostile blockade to find allies and come across a young boy who may bring balance to the Force, but the long dormant Sith resurface to claim their old glory.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BYTRhNjcwNWQtMGJmMi00NmQyLWE2YzItODVmMTdjNWI0ZDA2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SY999_SX666_AL_.jpg")!, director: "George Lucas"),
        Movie(id: 5, title: "Star Wars: Episode II - Attack of the Clones", year: "2002", genre: .sciFi, description: "Ten years after initially meeting, Anakin Skywalker shares a forbidden romance with Padmé Amidala, while Obi-Wan investigates an assassination attempt on the senator and discovers a secret clone army crafted for the Jedi.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BOWNkZmVjODAtNTFlYy00NTQwLWJhY2UtMmFmZTkyOWJmZjZiL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SY1000_CR0,0,752,1000_AL_.jpg")!, director: "George Lucas"),
        Movie(id: 6, title: "Star Wars: Episode III - Revenge of the Sith", year: "2005", genre: .sciFi, description: "Three years into the Clone Wars, the Jedi rescue Palpatine from Count Dooku. As Obi-Wan pursues a new threat, Anakin acts as a double agent between the Jedi Council and Palpatine and is lured into a sinister plan to rule the galaxy.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BNTc4MTc3NTQ5OF5BMl5BanBnXkFtZTcwOTg0NjI4NA@@._V1_SY1000_SX750_AL_.jpg")!, director: "George Lucas"),
        Movie(id: 7, title: "Star Wars: Episode VII - The Force Awakens", year: "2015", genre: .sciFi, description: "Three decades after the Empire's defeat, a new threat arises in the militant First Order. Stormtrooper defector Finn and the scavenger Rey are caught up in the Resistance's search for the missing Luke Skywalker.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_SY1000_CR0,0,677,1000_AL_.jpg")!, director: "J.J. Abrams"),
        Movie(id: 8, title: "Star Wars: Episode VIII - The Last Jedi", year: "2017", genre: .sciFi, description: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares for battle with the First Order.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BMjQ1MzcxNjg4N15BMl5BanBnXkFtZTgwNzgwMjY4MzI@._V1_SY1000_CR0,0,675,1000_AL_.jpg")!, director: "Rian Johnson"),
        Movie(id: 9, title: "Rogue One: A Star Wars Story", year: "2016", genre: .sciFi, description: "The daughter of an Imperial scientist joins the Rebel Alliance in a risky move to steal the Death Star plans.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BMjEwMzMxODIzOV5BMl5BanBnXkFtZTgwNzg3OTAzMDI@._V1_SY1000_SX675_AL_.jpg")!, director: "Gareth Edwards"),
        Movie(id: 10, title: "Solo: A Star Wars Story", year: "2018", genre: .sciFi, description: "During an adventure into a dark criminal underworld, Han Solo meets his future copilot Chewbacca and encounters Lando Calrissian years before joining the Rebellion.", image: URL(string: "https://ia.media-imdb.com/images/M/MV5BOTM2NTI3NTc3Nl5BMl5BanBnXkFtZTgwNzM1OTQyNTM@._V1_SY1000_CR0,0,674,1000_AL_.jpg")!, director: "Ron Howard")
    ]

    func searchMovie(title:String)->Movie!{
        if let movie = listOfMovies.first(where:{ $0.title.lowercased().starts(with: title.lowercased()) }) {
            return movie
        }
        return nil
    }
    
    func searchAllMovie(title:String)->Movie!{
        for movie in listOfMovies {
            if movie.title.containsCaseUnsensitive(str: title) {
                return movie
            }
        }
        return nil
    }
    
    func updateMovieDescription(id: Int, movieDescription: String) {
        if let index = listOfMovies.index(where:{ $0.id == id }){
            listOfMovies[index].description = movieDescription
        }
    }
}

extension String {
    func contains(str: String) -> Bool {
        return self.range(of: str) != nil
    }
    
    func containsCaseUnsensitive(str: String) -> Bool {
        return self.range(of: str, options: .caseInsensitive) != nil
    }
}
