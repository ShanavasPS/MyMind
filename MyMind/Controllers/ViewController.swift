//
//  ViewController.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var headerView:HomeHeaderView = HomeHeaderView();
    private var webServiceManager = WebServiceManager.sharedInstance;
    private var channels = Channels.sharedInstance;
    private var channelList:[Channel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar();
        registerCollectionViewHeader();
        
        webServiceManager.delegate = self;
        webServiceManager.fetchChannels();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        updateChannelsBasedOnCategory();
    }
    
    func registerCollectionViewHeader() {
        let myNib = UINib(nibName: Constants.Channel.Header.XibName,bundle: nil)
        self.collectionView.register(myNib, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Channel.Header.ReuseIdentifier)
    }
    
    func setUpNavigationBar() {
        //Add an icon to the navigation bar
        addNavBarImage();
        //Remove the back button text
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        //Set the topbar color to white
        navigationController?.navigationBar.barStyle = .black
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Channel.Cell.ReuseIdentifier,
                                                  for: indexPath) as! ChannelCell
    cell.channelImageView.image = UIImage(named: channelList[indexPath.row].channelImage);
    cell.channelName.text = channelList[indexPath.row].channelName;
    return cell
  }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        channels.currentChannel = channelList[indexPath.row];
        performSegue(withIdentifier: Constants.Segues.SelectedChannel, sender: nil);
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            headerView = self.collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: Constants.Channel.Header.ReuseIdentifier, for: indexPath) as! HomeHeaderView
            headerView.delegate = self;
                return headerView
            } else {
                return UICollectionReusableView()
            }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Width should be equal to accodomate the number of elements in the column
        let width = view.frame.size.width * CGFloat(Constants.Channel.Cell.MultiplyingFactor);
        return CGSize(width: width, height: width)
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

// MARK: - WebServiceManagerDelegate
extension ViewController: WebServiceManagerDelegate {
    func fetchChannelsSuccess() {
        channelList = channels.items;
        updateChannelsBasedOnCategory();
    }
}

// MARK: - HomeHeaderViewDelegate
extension ViewController: HomeHeaderViewDelegate {
    func updateChannelsBasedOnCategory() {
        switch channels.selectedChannelType {
        case .popular:
            //Get the channels that are of popular category
            channelList = channels.items.filter {$0.channelType == .popular};
        case .explore:
            //Get the channels that are of explore category
            channelList = channels.items.filter {$0.channelType == .explore};
        case .none:
            //Get the channels that are being followed
            channelList = channels.items.filter {$0.isFollowing == true};
        }
        self.collectionView.reloadData();
    }
}
