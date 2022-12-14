//
//  CreatePatientController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 3.11.22..
//

import UIKit

class CreatePatientController: UIViewController {
    
    let savedToken = UserDefaults.standard.object(forKey: "savedToken")
    

    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        //view.tintColor = UIColor.systemPurple
        return view
    }()
    

    let firstName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First name"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()
    
    let firstNameSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  
    let lastName: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last name"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()
    
    let lastNameSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  
    let email: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = UIColor(r: 216, g: 191, b: 216)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let password: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        return tf
    }()


    let passwordSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let adress: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Adress"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()

    let adressSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let phone: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Phone"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()

    let phoneSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let dateOfBirth: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Date of birth (dd.MM.yyyy)"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()

    let dateOfBirthSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let ssn: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ssn"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        return tf
    }()

    let ssnSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
       
        //lepa ljubicasta boja
        //button.backgroundColor = UIColor(r: 238, g: 225, b: 255)
        button.backgroundColor = UIColor(r: 108, g: 198, b: 68)
        button.setTitle("Create patient", for: .normal)
       // button.setTitleColor(UIColor(r: 164, g: 118, b: 255), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleCreatePatient), for: .touchUpInside)
        return button
    }()

    
   
    
    @IBAction func showAlertDialog(){
        
        // Declare Alert
               let dialogMessage = UIAlertController(title: "Created!", message: "Patient is created successfully!", preferredStyle: .alert)

               // Create OK button with action handler
               let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    print("Ok button click...")
                   // self.logoutFun()
                 
                   let navBar = CustomTabBarController()
                    navBar.tabBar.backgroundColor = .white
                    
                    let navController = UINavigationController(rootViewController: navBar)
                    UIApplication.shared.windows.first!.rootViewController = navController
                   
                   self.present(ProfileController(), animated: true)
               })

               //Add OK and Cancel button to dialog message
               dialogMessage.addAction(ok)

               // Present dialog message to user
               self.present(dialogMessage, animated: true, completion: nil)
        
    }

    func logoutFun(){
        UIApplication.shared.windows.first!.rootViewController = ManagePatientsController()
       
    }
   
    
    @objc func handleCreatePatient() {
        
        let patient = CreatePatient(firstName: firstName.text, lastName: lastName.text, email: email.text, password: password.text, address: adress.text, phone: phone.text, dateOfBirth: dateOfBirth.text, ssn: ssn.text)
        APIManager.shared.postCreatePatient(token: savedToken as! NSObject, patient: patient) { (error) in
            if let error = error {
                print("Falied to create patient!", error)
                return
            }
            print("Finished creating patient!")
            ManagePatientsController.shared.getAllPatients()
        }
        
        showAlertDialog()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // view.backgroundColor = UIColor(r: 203, g: 195, b: 227)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(r: 255, g: 255, b: 240).cgColor, UIColor(r: 237, g: 234, b: 222).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        view.backgroundColor =  UIColor.white
        
        navigationItem.title = "Create patient"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        view.addSubview(inputsContainerView)
        view.addSubview(createButton)
        
        setupInputsContainerView()
        setupSubmitConfirmButton()
    }
    
    func setupInputsContainerView(){
        
        //constraints for inputsContainer -> we'll have there email & password
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        
        inputsContainerView.addSubview(firstName)
        inputsContainerView.addSubview(firstNameSeparatorView)
        inputsContainerView.addSubview(lastName)
        inputsContainerView.addSubview(lastNameSeparatorView)
        inputsContainerView.addSubview(email)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(password)
        inputsContainerView.addSubview(passwordSeparatorView)
        inputsContainerView.addSubview(adress)
        inputsContainerView.addSubview(adressSeparatorView)
        inputsContainerView.addSubview(phone)
        inputsContainerView.addSubview(phoneSeparatorView)
        inputsContainerView.addSubview(dateOfBirth)
        inputsContainerView.addSubview(dateOfBirthSeparatorView)
        inputsContainerView.addSubview(ssn)
    
  
        firstName.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        firstName.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        firstName.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        firstName.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
      
        
        firstNameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        firstNameSeparatorView.topAnchor.constraint(equalTo: firstName.bottomAnchor).isActive = true
        firstNameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        firstNameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        lastName.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor).isActive = true
        lastName.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        lastName.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
        
        lastNameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        lastNameSeparatorView.topAnchor.constraint(equalTo: lastName.bottomAnchor).isActive = true
        lastNameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        lastNameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        email.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        email.topAnchor.constraint(equalTo: lastName.bottomAnchor).isActive = true
        email.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        email.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
        
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: email.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        password.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        password.topAnchor.constraint(equalTo: email.bottomAnchor).isActive = true
        password.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        password.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
       
        passwordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        passwordSeparatorView.topAnchor.constraint(equalTo: password.bottomAnchor).isActive = true
        passwordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        adress.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        adress.topAnchor.constraint(equalTo: password.bottomAnchor).isActive = true
        adress.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        adress.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
        
        adressSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        adressSeparatorView.topAnchor.constraint(equalTo: adress.bottomAnchor).isActive = true
        adressSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        adressSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
       
        phone.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        phone.topAnchor.constraint(equalTo: adress.bottomAnchor).isActive = true
        phone.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        phone.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
    
        phoneSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        phoneSeparatorView.topAnchor.constraint(equalTo: phone.bottomAnchor).isActive = true
        phoneSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        phoneSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        dateOfBirth.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        dateOfBirth.topAnchor.constraint(equalTo: phone.bottomAnchor).isActive = true
        dateOfBirth.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        dateOfBirth.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
        
     
        dateOfBirthSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        dateOfBirthSeparatorView.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor).isActive = true
        dateOfBirthSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        dateOfBirthSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    
        ssn.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        ssn.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor).isActive = true
        ssn.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        ssn.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/8).isActive = true
    }
    
    func setupSubmitConfirmButton(){
        //we need x, y, width, height constraints
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        createButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }

}
