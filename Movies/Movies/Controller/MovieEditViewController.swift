import UIKit

class MovieEditViewController: UIViewController {
    
    @IBOutlet weak var movieDescription: UITextView!
    var textToEdit:String? = ""
    var movieEditDelegate: MovieEditViewControllerDelegate?
    
    //convenience init() {
     //   self.init(movieEditDelegate: nil,textToEdit:nil)
    //}
    
    init(textToEdit:String?) {
        self.textToEdit = textToEdit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDescription.text = textToEdit
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        movieEditDelegate?.plotEdited(withText: movieDescription.text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
