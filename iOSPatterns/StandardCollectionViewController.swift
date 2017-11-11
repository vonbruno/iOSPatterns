//
//  IntrinsicSizeCollectionViewController.swift
//  IntrisicSize
//
//  Created by Bruno, Nathan on 12/13/16.
//  Copyright © 2016 VonBruno. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IntrinsicSizeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    struct Constants {
        static let columns = 1
        static let horizontalLabelPadding: CGFloat = 0.0
    }
    
    @IBOutlet var myCollectionView: UICollectionView!

    let data = ["The `HKDL [Debug]` target overrides the `CLANG_CXX_LIBRARY` build setting defined in `Pods/Target Support Files/Pods-ParkPlatform-HKDL/Pods-ParkPlatform-HKDL.debug.xcconfig'. This can lead to problems with the CocoaPods installation",
                "- Remove the build settings from the target.",
                "Use the `$(inherited)`"]
    
    //1 add
    override func viewDidLayoutSubviews() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> IntrinsicSizeCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? IntrinsicSizeCollectionViewCell
    
        cell?.textLabel.text = data[indexPath.item]
        
        //2 add
        cell?.widthConstraint.constant = (self.view.frame.width - Constants.horizontalLabelPadding * 2) / CGFloat(Constants.columns)
        return cell!
    }
    
}
