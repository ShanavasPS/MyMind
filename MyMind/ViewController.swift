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
    private var headerView:HomeHeaderView = HomeHeaderView();
    var channels = Channels.sharedInstance;
    var channelList:[Channel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage();
        loadChannels();
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        
        let myNib = UINib(nibName: "HomeHeaderView",bundle: nil)
        self.collectionView.register(myNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
    }
    
    func loadChannels() {
        channels.add(name: "FASHION", image: "Thumbnail_channel_Fashion", followers: "234k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "SCIENCE", image: "Thumbnail_channel_Science", followers: "123k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "AUTO", image: "Thumbnail_channel_Auto", followers: "100k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "TECHNOLOGY", image: "Thumbnail_channel_Technology", followers: "23.6k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "ENTERTAINMENT", image: "Thumbnail_channel_Entertainment", followers: "63k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "ENVIRONMENT", image: "Thumbnail_channel_Environment", followers: "111k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "FINANCES", image: "Thumbnail_channel_Finance", followers: "234k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "TRAVEL", image: "Thumbnail_channel_Travel", followers: "422k Followers", channelType: .popular, isFollowing: true);
        var index = 0;
        channels.items.map({_ in
            self.loadNews(index: index);
            index += 1;
            })
        channelList = channels.items;
    }
    
    func loadNews(index: Int) {
        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015");
        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015");
        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015");
        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015");
        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015");
        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015");
        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015");
        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015");
        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015");
        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015");
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
    return channelList.count;
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! ChannelCell
    cell.channelImageView.image = UIImage(named: channelList[indexPath.row].channelImage);
    cell.channelName.text = channelList[indexPath.row].channelName;
    let frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2, height: self.view.frame.width/2)
    cell.channelImageView.frame = frame;
    
    return cell
  }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        channels.currentChannel = channelList[indexPath.row];
        performSegue(withIdentifier: "showSelectedChannel", sender: nil);
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            headerView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier:"HomeHeaderView", for: indexPath) as! HomeHeaderView
            headerView.delegate = self;
                return headerView
            } else {
                return UICollectionReusableView()
            }
    }
}

extension ViewController: HomeHeaderViewDelegate {
    func updateTableBasedonHeader(_ type: ChannelType) {
        switch type {
        case .popular:
            channelList = channels.items.filter {$0.channelType == .popular};
        case .explore:
            channelList = channels.items.filter {$0.channelType == .explore};
        case .none:
            channelList = channels.items;
        }
        self.collectionView.reloadData();
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
