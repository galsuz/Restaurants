//
//  RateViewController.swift
//  Restaurants
//
//  Created by Алсу Гиниятуллина  on 21.04.2021.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var brilliantButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4) {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
        
        
    }
}
