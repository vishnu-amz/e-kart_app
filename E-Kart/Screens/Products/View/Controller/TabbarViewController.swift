//
//  TabbarViewController.swift
//  E-Kart
//
//  Created by Vishnu - iOS on 29/08/23.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addTopBorderToTabBar()
    }
    
    func addTopBorderToTabBar() {
        let border = CALayer()
        let borderWidth: CGFloat = 1.0
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: borderWidth)
        border.borderWidth = borderWidth
        tabBar.layer.addSublayer(border)
        tabBar.clipsToBounds = true
    }
    

}
