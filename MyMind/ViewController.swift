//
//  ViewController.swift
//  MyMind
//
//  Created by Shamnad PS on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage();
    }

    func addNavBarImage() {
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "Icon_navbar_Logo");
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth - 20, height: bannerHeight - 20)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
}

