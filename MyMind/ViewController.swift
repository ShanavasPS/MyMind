//
//  ViewController.swift
//  MyMind
//
//  Created by Shamnad PS on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    private let reuseIdentifier = "ChannelCell"
    private let channelImages = [#imageLiteral(resourceName: "Thumbnail_channel_Fashion"), #imageLiteral(resourceName: "Thumbnail_channel_Science"), #imageLiteral(resourceName: "Thumbnail_channel_Auto"), #imageLiteral(resourceName: "Thumbnail_channel_Technology"), #imageLiteral(resourceName: "Thumbnail_channel_Entertainment"), #imageLiteral(resourceName: "Thumbnail_channel_Environment"), #imageLiteral(resourceName: "Thumbnail_channel_Finance"), #imageLiteral(resourceName: "Thumbnail_channel_Travel")];
    private let channelNames = ["FASHION", "SCIENCE", "AUTO", "TECHNOLOGY", "ENTERTAINMENT", "ENVIRONMENT", "FINANCES", "TRAVEL"];
    
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

// MARK: - UICollectionViewDataSource
extension ViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! ChannelCell
    cell.channelImageView.image = channelImages[indexPath.row];
    cell.channelName.text = channelNames[indexPath.row];
    let frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: self.view.frame.width/2)
    cell.channelImageView.frame = frame;
    
    return cell
  }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didDeselectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSelectedChannel", sender: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width
        return CGSize(width: width * 0.5, height: width * 0.5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
