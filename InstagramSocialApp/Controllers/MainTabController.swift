//
//  MainTabController.swift
//  InstagramSocialApp
//
//  Created by Balachandar S on 03/02/21.
//  Copyright © 2021 Balachandar S. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK : PROPERTIES
    
    
    //MARK : LIFECYCLE
    override func viewDidLoad() {
        view.backgroundColor = .red
        configureViewControllers()
    }
    
    //MARK : Helpers
    
    func configureViewControllers(){
        
        
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController())
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageUploaderController())
        let notification = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_selected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        
        viewControllers = [feed,search,imageSelector,notification,profile]
        tabBar.tintColor = .black
        
    }
    
    
    func templateNavigationController(unselectedImage : UIImage,selectedImage : UIImage,rootViewController : UIViewController) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.image = unselectedImage
        nav.navigationBar.tintColor = .black
        
        return nav
        
    }
}
