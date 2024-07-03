//
//  UIViewController+.swift
//  TaskyApp
//
//  Created by Edson Brandon on 02/07/24.
//

import UIKit

extension UIViewController {
    func addGradientBackground() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilic)?.cgColor ?? UIColor.purple.cgColor]
        
        view.layer.insertSublayer(gradientBackground, at: 0)
    }
}
