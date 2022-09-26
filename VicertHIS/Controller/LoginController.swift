//
//  LoginController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit

class LoginController: UIViewController {
    
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(r: 244, g: 241, b: 255)
        button.backgroundColor = UIColor(r: 238, g: 225, b: 255)
        button.setTitle("Login", for: .normal)
       // button.setTitleColor(UIColor(r: 164, g: 118, b: 255), for: .normal)
        button.setTitleColor(UIColor(r: 176, g: 129, b: 255), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func handleLogin() {
        print(123)
    }
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        //backgroundColor = UIColor(r: 238, g: 225, b: 255)
        button.setTitle("Reset password", for: .normal)
        button.setTitleColor(UIColor(r: 176, g: 129, b: 255), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        button.tintColor = .clear
        return button
    }()
    
    
    @objc func handleReset() {
        present(ResetPasswordController(), animated: true, completion: nil)
    }
    
    
    // *** email
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "E-mail adress"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // *** password
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // *** profile image view
   lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "health1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
       // imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
       imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 203, g: 195, b: 227)
        
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(profileImageView)
        view.addSubview(resetButton)
        
        setupInputsContainerView()
        setupLoginButton()
        setupProfileImageView()
        setupResetButton()
        
      
    }
    
    func setupInputsContainerView(){
        
        //constraints for inputsContainer -> we'll have there email & password
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        
        //we need x, y, width, height constraints for EMAIL TEXT FIELD
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
       // emailTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
       // emailTextFieldHeightAnchor?.isActive = true
        
        
        //we need x, y, width, height constraints for EMAIL SEPARATOR VIEW
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //we need x, y, width, height constraints for PASSWORD TEXT FIELD
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
      //  emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
       // emailTextFieldHeightAnchor?.isActive = true
        
        
    }
    
    func setupLoginButton() {
        //we need x, y, width, height constraints
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupResetButton(){
        
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12).isActive = true
        resetButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func  setupProfileImageView(){
        //we need x, y, width, height constraints for the profile image
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
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
