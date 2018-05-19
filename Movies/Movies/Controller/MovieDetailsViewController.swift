import UIKit
import PureLayout
import Kingfisher

class MovieDetailsViewController: UIViewController, MovieEditViewControllerDelegate {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: Movie?
    
    convenience init() {
        self.init(movie: nil)
    }
    
    init(movie: Movie?) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.done, target:self, action: #selector(editButtonTapped))
        initialConstrains()
        loadMovie()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        movieImage.isUserInteractionEnabled = true
        movieImage.addGestureRecognizer(tapGestureRecognizer)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadMovie()
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func editButtonTapped() {
        let movieEditViewController = MovieEditViewController(textToEdit: movie?.description)
        movieEditViewController.movieEditDelegate = self
        self.navigationController?.pushViewController(movieEditViewController, animated: true)
    }

    @objc func imageTapped(){
        let imageShowViewController = ImageShowViewController(imageUrl: movie?.image)
        self.navigationController?.pushViewController(imageShowViewController, animated: true)
    }


    func initialConstrains(){
        
        movieTitle.autoAlignAxis(toSuperviewAxis: .vertical)
        movieTitle.autoPinEdge(.top, to: ALEdge.bottom, of: movieImage, withOffset: 15)
        
        year.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        year.autoPinEdge(.top, to: ALEdge.bottom, of: movieTitle, withOffset: 20)
        genre.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        genre.autoPinEdge(.top, to: ALEdge.bottom, of: year, withOffset: 20)
        director.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        director.autoPinEdge(.top, to: ALEdge.bottom, of: genre, withOffset: 20)

        movieYear.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
        movieYear.autoAlignAxis(toSuperviewAxis: .vertical)
        movieGenre.autoPinEdge(.top, to: .bottom, of: movieYear, withOffset: 20)
        movieGenre.autoAlignAxis(toSuperviewAxis: .vertical)
        movieDirector.autoPinEdge(.top, to: ALEdge.bottom, of: movieGenre, withOffset: 20)
        movieDirector.autoAlignAxis(toSuperviewAxis: .vertical)

        movieDescription.autoPinEdge(toSuperviewEdge: .left, withInset: 16)
        movieDescription.autoPinEdge(toSuperviewEdge: .right, withInset: 16)
        movieDescription.autoPinEdge(.top, to: ALEdge.bottom, of: director, withOffset: 20)
        
    }
    
    func loadMovie(){
        movieTitle.text = movie?.title
        movieYear.text = movie?.year
        movieGenre.text = movie?.genre.rawValue
        movieDirector.text = movie?.director
        movieDescription.text = movie?.description
        movieDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
        movieDescription.numberOfLines = 0
        
        movieImage.kf.setImage(with: movie?.image)
    }
    
    func plotEdited(withText text: String) {
        movie?.description = text
    }
}
