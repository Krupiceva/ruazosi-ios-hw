import UIKit
import PureLayout

class MovieSearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    var listOfMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConstrains()
        self.searchField.delegate = self as UITextFieldDelegate
    }

    override func viewWillAppear(_ animated: Bool) {
        searchField.text = ""
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchMovie()
        return true
    }

    @IBAction func onSearchButtonTapped(_ sender: UIButton) {
        searchMovie()
    }
    
    func searchMovie(){
        if let search = searchField.text {
            if let movie = MovieDataBase.database.searchAllMovie(title: search){
                let movieDetailsViewController = MovieDetailsViewController(movie: movie)
                self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "No such movie in database!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)

            }
        }
    }
    
    func initialConstrains(){
        searchLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        searchLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        searchField.placeholder = "Enter movie name..."
        searchField.autoAlignAxis(toSuperviewAxis: .vertical)
        searchField.autoSetDimensions(to: CGSize(width: 200, height: 50))
        searchField.autoPinEdge(.top, to:ALEdge.bottom, of: searchLabel, withOffset: 30)
        searchButton.autoAlignAxis(toSuperviewAxis: .vertical)
        searchButton.autoPinEdge(.top, to:ALEdge.bottom, of: searchField, withOffset: 30)
    }
}
