//
//  NavBarController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 4.10.22..
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeNavControler = UINavigationController(rootViewController: HomeController())
        homeNavControler.title = "Home"
        
        homeNavControler.tabBarItem.image = UIImage(named: "home")
        
        
        let appointmentsNavControler = UINavigationController(rootViewController: AppointmentsController())
        appointmentsNavControler.tabBarItem.title = "Appointments"
        appointmentsNavControler.title = "Appointments"
        appointmentsNavControler.tabBarItem.image = UIImage(named: "appointments")
        
        let profileNavControler = UINavigationController(rootViewController: ProfileController())
        profileNavControler.tabBarItem.title = "Profile"
        profileNavControler.title = "Profile"
        profileNavControler.tabBarItem.image = UIImage(named: "profile2")
  
        let findCareController = UINavigationController(rootViewController: FindCareController())
        findCareController.tabBarItem.title = "Find Care"
        findCareController.title = "Find Care"
        findCareController.tabBarItem.image = UIImage(named: "doctor2")
        
        
        viewControllers = [homeNavControler, findCareController, appointmentsNavControler, profileNavControler]
        
        tabBar.isTranslucent = false
        
        
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.init(r: 229, g: 231, b: 235).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        

    }
    
    
}

