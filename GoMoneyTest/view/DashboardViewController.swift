//
//  DashboardViewController.swift
//  GoMoneyTest
//
//  Created by Chukwuebuka Nwudo on 03/11/2021.
//

import UIKit

class DashboardViewController: UITabBarController,UITabBarControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
        print("got to dashboard")
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.barTintColor = .white
        
        //self.navigationController?.isNavigationBarHidden = true
        let tabOne = FixtureViewController()
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "ic_footbal.png"), selectedImage: UIImage(named: "ic_footbal.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = CompetitionViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "", image: UIImage(named: "ic_field.png"), selectedImage: UIImage(named: "ic_field.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.viewControllers = [tabOne,tabTwo]
    }
 
    func setNavBarTitle(_ titleVal:String){
        var label = UILabel();
                    label.text = titleVal
        label.textAlignment = .left
                    label.sizeToFit()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: label)
    }

}
