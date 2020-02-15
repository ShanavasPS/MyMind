//
//  ViewController.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    private let reuseIdentifier = "ChannelCell"
    private var headerView:HomeHeaderView = HomeHeaderView();
    private var webServiceManager = WebServiceManager.sharedInstance;
    var channels = Channels.sharedInstance;
    var channelList:[Channel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage();
        
        webServiceManager.delegate = self;
        webServiceManager.fetchChannels();
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        navigationItem.backBarButtonItem!.title = "";
        let myNib = UINib(nibName: "HomeHeaderView",bundle: nil)
        self.collectionView.register(myNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        updateTableBasedonHeader(channels.selectedChannelType);
    }

    func addNavBarImage() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Icon_navbar_Logo"))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
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
            channelList = channels.items.filter {$0.isFollowing == true};
        }
        channels.selectedChannelType = type;
        self.collectionView.reloadData();
    }
}

extension ViewController: WebServiceManagerDelegate {
    func fetchChannelsSuccess() {
        channelList = channels.items;
        updateTableBasedonHeader(channels.selectedChannelType);
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
