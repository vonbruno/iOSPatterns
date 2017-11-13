//
//  CTAButtonViewController.swift
//  iOSPatterns
//
//  Created by Bruno, Nathan on 11/10/17.
//  Copyright © 2017 Nathan Bruno. All rights reserved.
//

import UIKit

protocol CTAButtonViewControllerProtocol: NSObjectProtocol {
    func viewsLayedOut()
}

class CTAButtonViewController: UIViewController {

    fileprivate let cornerRadius: CGFloat = 14
    fileprivate let buttonHeight: CGFloat = 60
    weak var delegate: CTAButtonViewControllerProtocol?
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    
    //configurable stuff
    var buttonTitle = "FPO Button Title"
    var buttonColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    
    //public
    var viewHeight: CGFloat {
        get{
            return visualEffectView.frame.size.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle(buttonTitle, for: .normal)
        button.backgroundColor = buttonColor
        buttonHeightConstraint.constant = buttonHeight
        self.button.layer.cornerRadius = cornerRadius
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delegate?.viewsLayedOut()
    }
}
