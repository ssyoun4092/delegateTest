import UIKit

class ViewController: UIViewController, TappedDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    let cellController = CollectionViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        cellController.delegate = self
        cellController.test = 5
    }

    func tappedXButton() {
        print("TappedXButton")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        //        print(self.labels[indexPath.row].index)
        cell.cellLabel.text = "Hi"
        cell.backgroundColor = UIColor.systemMint

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = 2
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let itemsPerColumn: CGFloat = 3
        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        let cellHeight = (height - heightPadding) / itemsPerColumn

        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return sectionInsets.left
    }
}
