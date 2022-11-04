//
//  PatientProfileViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 4.11.22..
//

import UIKit

class PatientProfileViewController: UIViewController {
    
    
    private lazy var stackView: UIStackView = {
        
        let hStackView = makeHorizontalStackView(image: UIImage(named: "profile2")!, title: result.firstName + " " + result.lastName )
        let hStackView2 = makeHorizontalStackView(image: UIImage(named: "home8")!, title: result.address!)
        let hStackView3 = makeHorizontalStackView(image: UIImage(named: "email")!, title: result.email!)
        let hStackView4 = makeHorizontalStackView(image: UIImage(named: "phone")!, title: result.phone!)
        let hStackView5 = makeHorizontalStackView(image: UIImage(named: "calendar2")!, title: result.dateOfBirth!.convertDateString())
      

        var stackView = UIStackView(arrangedSubviews: [hStackView, hStackView2, hStackView3, hStackView4, hStackView5])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleAspectFit
        stackView.setCustomSpacing(35.0, after: hStackView5)
        
        return stackView
    }()
    
    private func makeHorizontalStackView(image: UIImage, title: String) -> UIStackView {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 16, weight: .light)
            
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
       
        
        return stackView
    }
    
    let result: PatientResult
    
    init(result: PatientResult){
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
       
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
       
        navigationItem.title = "Patient Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        view.backgroundColor = UIColor(r: 253, g: 245, b: 230)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
    }
    
    
    // LOGOUT ALERT BUTTON
    @IBAction func showAlertDialog(){
        
        // Declare Alert
               let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to Logout?", preferredStyle: .alert)

               // Create OK button with action handler
               let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button click...")
                    self.logoutFun()
               })

               // Create Cancel button with action handlder
               let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                   print("Cancel button click...")
               }

               //Add OK and Cancel button to dialog message
               dialogMessage.addAction(ok)
               dialogMessage.addAction(cancel)

               // Present dialog message to user
               self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    @objc func handleLogout(){
        showAlertDialog()
    }
    
    func logoutFun(){
        UIApplication.shared.windows.first!.rootViewController = LoginController()
    }
}





