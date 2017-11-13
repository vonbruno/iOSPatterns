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
        
        ctaButton = CTAButton(parentViewController: self, title: "Purchase", color: .green)
    }
    
}
