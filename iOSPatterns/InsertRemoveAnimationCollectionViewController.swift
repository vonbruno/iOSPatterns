//
//  InsertRemoveAnimationCollectionViewController.swift
//  iOSPatterns
//
//  Created by Bruno, Nathan on 3/29/19.
//  Copyright © 2019 Nathan Bruno. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class InsertRemoveAnimationCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    struct Constants {
        static let columns = 1
        static let horizontalLabelPadding: CGFloat = 0.0
    }
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var data = ["The `HKDL [Debug]` target overrides the `CLANG_CXX_LIBRARY` build setting defined in `Pods/Target Support Files/Pods-ParkPlatform-HKDL/Pods-ParkPlatform-HKDL.debug.xcconfig'. This can lead to problems with the CocoaPods installation",
                "- Remove the build settings from the target.",
                "Use the `$(inherited)`", "The `HKDL [Debug]` target overrides the `CLANG_CXX_LIBRARY` build setting defined in `Pods/Target Support Files/Pods-ParkPlatform-HKDL/Pods-ParkPlatform-HKDL.debug.xcconfig'. This can lead to problems with the CocoaPods installation",
                "- Remove the build settings from the target.",
                "Use the `$(inherited)`"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.setCollectionViewLayout(HiroFlowLayout(), animated: false)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> IntrinsicSizeCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? IntrinsicSizeCollectionViewCell
        
        cell?.textLabel.text = data[indexPath.item]
        
        return cell!
    }
    
    //Add Cell
    @IBAction func addPressed(_ sender: Any) {
        let indexPath = IndexPath(item: 1, section: 0)
        myCollectionView.performBatchUpdates({
            myCollectionView.insertItems(at: [indexPath])
            self.data.insert("Sergio is boss", at: indexPath.row)
        }, completion: nil)
    }
    
    //Remove Cell
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.2, animations: {
            cell?.alpha = 0
        }) { (yes) in
            collectionView.performBatchUpdates({
                self.data.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
                
            }, completion: nil)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}

class HiroFlowLayout : UICollectionViewFlowLayout {
    var insertingCellIndexPaths = [IndexPath]()
    var removingCellIndexPaths = [IndexPath]()
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        
        insertingCellIndexPaths.removeAll()
        
        for update in updateItems {
            if let indexPath = update.indexPathAfterUpdate,
                update.updateAction == .insert {
                insertingCellIndexPaths.append(indexPath)
            }
        }
    }
    
    override func finalizeCollectionViewUpdates() {
        super.finalizeCollectionViewUpdates()
        
        insertingCellIndexPaths.removeAll()
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        
        if insertingCellIndexPaths.contains(itemIndexPath) {
            attributes?.frame = CGRect(x: 0, y: 100.0, width: collectionView!.bounds.width, height: 0)
        }
        return attributes
    }

}
