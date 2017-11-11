//
//  ViewControllerBasedCollectionview.swift
//  iOSPatterns
//
//  Created by Bruno, Nathan on 1/7/17.
//  Copyright © 2017 Disney Online. All rights reserved.
//

import UIKit

class ViewControllerBasedCollectionview: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var horizontalOrVeritcal: UISegmentedControl!
    @IBOutlet weak var numberOfColumns: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var columns: CGFloat = 1
    var cellHeight: CGFloat = 0.0
    var cellWidth: CGFloat = 0.0
    
    //let data = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu."]
    
    //let data = ["Lorem ipsum","Lorem ipsum", "Lorem ipsum","Lorem ipsum","Lorem ipsum", "Lorem ipsum"]
    
    let data = ["Lorem ipsum","Lorem ipsum", "Lorem ipsum","Lorem ipsum dolor sit er elit lamet,","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu,"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        horizontalVerticalPressed(self)
        columnsPressed(self)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //1. set the cell width property and trigger sizeForItemAt: with estimatedItemSize property
        self.cellWidth = collectionView.frame.width / columns
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }

    //MARK: UICollectionView methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath)

        //2. Instantiate the viewcontroller for the cell
        let labelVC = LabelViewController.fromStoryboard()
        //3. Call .view to instantiate the IBOutlets before setting them
        if let labelview = labelVC?.view {
            //Optional: set content in the VC
            labelVC?.label.text = data[indexPath.item]
            //4. Set the width constraint for the VC
            labelVC?.widthConstraint.constant = cellWidth
            //5. Set the frame of the VC
            labelview.frame = cell.bounds
            //6. Add VC as subview to the cell
            cell.addSubview(labelview)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //7. return cell size from ViewController
        let size = LabelViewController.cellSizeFor(width: self.cellWidth, title: data[indexPath.item])
        
        //Optional: find the highest cell height
        if size.height > cellHeight {
            cellHeight = size.height
            collectionViewHeight.constant = cellHeight
        }
    
        return size
    }
    
    
    //MARK: IBActions

    @IBAction func columnsPressed(_ sender: Any) {
        
        switch numberOfColumns.selectedSegmentIndex {
        case 0:
            columns = 1
        case 1:
            columns = 2
        case 2:
            columns = 3
        default:
            columns = 1
        }
        //TODO: find out how to show changes to columns after switch
    }
    

    @IBAction func horizontalVerticalPressed(_ sender: Any) {
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            switch horizontalOrVeritcal.selectedSegmentIndex {
            case 0:
                layout.scrollDirection = .vertical
            case 1:
                layout.scrollDirection = .horizontal
            default:
                break
            }
        }
    }
}
