//
//  CTAButton.swift
//  iOSPatterns
//
//  Created by Bruno, Nathan on 11/11/17.
//  Copyright © 2017 Nathan Bruno. All rights reserved.
//

import UIKit

protocol CTAButtonProtocol: NSObjectProtocol {
    func ctaButtonPressed()
}

class CTAButton: NSObject {
    
    fileprivate let ctaButtonVC = CTAButtonViewController.init(nibName: "CTAButtonViewController", bundle: nil)
    fileprivate let parentVC: UIViewController
    var isActive: Bool {
        didSet {
            //TODO: deactivate visually
        }
    }
    
    init(parentViewController: UIViewController, title: String, color: UIColor) {
        
        ctaButtonVC.buttonTitle = title
        ctaButtonVC.buttonColor = color
        parentVC = parentViewController
        parentVC.addChildViewController(ctaButtonVC)
        
        parentVC.view.addSubview(ctaButtonVC.view)
        ctaButtonVC.didMove(toParentViewController: parentVC)
        ctaButtonVC.view.frame = parentVC.view.frame
        isActive = true
        super.init()
        ctaButtonVC.delegate = self
    }
}

extension CTAButton: CTAButtonViewControllerProtocol {
    func viewsLayedOut() {
        let ctaButttonHeight: CGFloat = ctaButtonVC.viewHeight
        ctaButtonVC.view.frame = CGRect(x: parentVC.view.frame.origin.x,
                                        y: parentVC.view.frame.size.height - ctaButttonHeight,
                                        width: parentVC.view.frame.size.width,
                                        height: ctaButttonHeight)
    }
}
