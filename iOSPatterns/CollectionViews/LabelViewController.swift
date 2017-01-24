

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    
    open class func fromStoryboard() -> LabelViewController? {
        /*
        var viewController: TandPActionBarCollectionViewCell?
        if let tandpBundle = TandPBundle.ticketsAndPassesBundle(){
            //create vc here
        }*/
        var viewController: LabelViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "LabelViewController") as? LabelViewController {
            viewController = controller
        }
        return viewController
    }
    
    open class func cellSizeFor(width: CGFloat, title: String) -> CGSize {
        
        var size = CGSize.zero
        if let controller = LabelViewController.fromStoryboard(),
            let view = controller.view {
            
            controller.label.text = title
            controller.widthConstraint.constant = width
            view.updateConstraints()
            size = controller.view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        }
        return size
    }

}
