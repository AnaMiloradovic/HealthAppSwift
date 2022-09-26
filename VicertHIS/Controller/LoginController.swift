//
//  LoginController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 203, g: 195, b: 227)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}

extension UIColor{
                convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
            self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
        }
}
