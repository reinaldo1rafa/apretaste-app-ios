
//
//  TabBarMenuVC.swift
//  declareItSupport
//
//  Created by IOS Developer on 4/3/18.
//  Copyright © 2018 Technifiser. All rights reserved.
//

import UIKit

class TabBarMenuVC: UITabBarController {
    
    //MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabs()
        self.setupView()
        
    }
    
    
    //MARK: setups
    
    private func setupTabs(){
        
        
        
        // set style //
        
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor.lightGray
        } else {
            // Fallback on earlier versions
        }
        self.tabBar.tintColor = UIColor.white
        
        //MARK: configure root view controllers //
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()!
        
        let homeBarItem = UITabBarItem(title: "Inicio", image: UIImage.init(named: "home")!, tag: 0)
        homeVC.tabBarItem = homeBarItem
        
        let notificationVC = UIStoryboard(name: "Notification", bundle: nil).instantiateInitialViewController()!
        
        let notificationBarItem =  UITabBarItem(title: "notificación", image: UIImage.init(named: "email")!, tag: 0)
        
        notificationVC.tabBarItem = notificationBarItem
        
        let optionsVC = UIStoryboard(name: "options", bundle: nil).instantiateInitialViewController()!
        let optionsBarItem =   UITabBarItem(title: "Opciones", image: UIImage.init(named: "gear")!, tag: 0)
        optionsVC.tabBarItem = optionsBarItem
        
        self.viewControllers = [notificationVC,homeVC,optionsVC]
        
        //MARK: set root tab
        
        self.selectedIndex = 1
        
        
    }
    
    private func setupView(){
        
        //MARK: set styles //
        
        self.tabBar.tintColor = UIColor.white
        self.tabBar.barTintColor = UIColor.greenApp
        self.tabBar.isTranslucent = false

        
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = UIColor.darkGray
        }
        // set navigation bar style //
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let dataUrl = TEMPManager.shared.urlFiles!
        
        let urlImage = dataUrl.appendingPathComponent("user.jpg")
        
        do{
            let dataImage = try Data.init(contentsOf: urlImage)
            let image = UIImage(data: dataImage)
            let containView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 50, height: 30))
            
            let title = UILabel(frame: CGRect(x: 35, y: 5, width: 100, height: 15))
            let imageview = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            
            imageview.image = image
            imageview.contentMode = .scaleAspectFit
            title.text = TEMPManager.shared.fetchData.username
            title.textColor = .white
            title.font = UIFont.systemFont(ofSize: 15)
            imageview.layer.cornerRadius = 20
            imageview.layer.masksToBounds = true
            containView.addSubview(imageview)
            containView.addSubview(title)
            let rightBarButton = UIBarButtonItem(customView: containView)
            self.navigationItem.leftBarButtonItem = rightBarButton
            
        }catch{
            print("error load image")
        }

        
    }
    
    //MARK: - override tabBar methods
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
        tabBar.tintColor = UIColor.white
        
    }
    
    
}
