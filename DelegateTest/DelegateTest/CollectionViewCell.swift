protocol TappedDelegate {
    func tappedXButton()
}

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellLabel: UILabel!
    var delegate: TappedDelegate?
    var test: Int? {
        didSet {
            print("TEST")
        }
    }

    @IBAction func tappedXButton(_ sender: UIButton) {
        delegate?.tappedXButton()
    }
}
