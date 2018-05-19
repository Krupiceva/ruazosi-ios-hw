import UIKit
import Kingfisher

class ImageShowViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var movieImage: UIImageView!
    var imageUrl: URL?
    
    convenience init() {
        self.init(imageUrl: nil)
    }
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView?.delegate = self
        scrollView?.minimumZoomScale = 0.5
        scrollView?.maximumZoomScale = 1.5

        movieImage.kf.setImage(with: imageUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ImageShowViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return movieImage
    }
}
