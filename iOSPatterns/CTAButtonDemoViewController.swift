//
//  CTAButtonDemoViewController.swift
//  iOSPatterns
//
//  Created by Bruno, Nathan on 11/10/17.
//  Copyright © 2017 Nathan Bruno. All rights reserved.
//

import UIKit

class CTAButtonDemoViewController: UIViewController {

    var ctaButton:CTAButton?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ctaButton = CTAButton(parentViewController: self, title: "Purchase", color: #colorLiteral(red: 0.2730545998, green: 0.5946603417, blue: 0.8688541055, alpha: 1))
    }
    
}
