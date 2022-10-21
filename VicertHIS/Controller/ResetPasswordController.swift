//
//  ResetPasswordController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 26.9.22..
//

import UIKit

class ResetPasswordController: UIViewController {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        //view.tintColor = UIColor.systemPurple
        return view
    }()
    
    // *** email
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "E-mail adress"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // *** password
    let oldPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Old password"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let oldPasswordSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ***new password
    let newPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "New password"
        tf.textColor = UIColor(r: 216, g: 191, b: 216)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let newPasswordSeparatorView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(r: 216, g: 191, b: 216)
       view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ***confirm password
    let confirmNewPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Confirm new password"
        tf.textColor = UIColor(r: 49, g: 43.9, b: 59.6)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    
    //reset button
    lazy var resetConfirmButton: UIButton = {
        let button = UIButton(type: .system)
       
        //lepa ljubicasta boja
        //button.backgroundColor = UIColor(r: 238, g: 225, b: 255)
        button.backgroundColor = UIColor(r: 108, g: 198, b: 68)
        button.setTitle("Reset", for: .normal)
       // button.setTitleColor(UIColor(r: 164, g: 118, b: 255), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(handleCreateDoctor), for: .touchUpInside)
        return button
    }()
    
    @objc func handleCreateDoctor() {
        print(123)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
            // view.backgroundColor = UIColor(r: 203, g: 195, b: 227)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(r: 17, g: 28, b: 187).cgColor, UIColor(r: 255, g: 153, b: 255).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        view.backgroundColor =  UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        view.addSubview(inputsContainerView)
        view.addSubview(resetConfirmButton)
        
        
        setupInputsContainerView()
        setupResetConfirmButton()
        
    
    }
    
    func setupInputsContainerView(){
        
        //constraints for inputsContainer -> we'll have there email & password
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(oldPasswordTextField)
        inputsContainerView.addSubview(oldPasswordSeparatorView)
        inputsContainerView.addSubview(newPasswordTextField)
        inputsContainerView.addSubview(newPasswordSeparatorView)
        inputsContainerView.addSubview(confirmNewPasswordTextField)
        
        
        //we need x, y, width, height constraints for EMAIL TEXT FIELD
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true
       // emailTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
       // emailTextFieldHeightAnchor?.isActive = true
        
        
        //we need x, y, width, height constraints for EMAIL SEPARATOR VIEW
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //we need x, y, width, height constraints for OLD PASSWORD TEXT FIELD
        oldPasswordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        oldPasswordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        oldPasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        oldPasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
      //  emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3)
       // emailTextFieldHeightAnchor?.isActive = true
        
        //we need x, y, width, height constraints for OLD PASSWORD SEPARATOR VIEW
        oldPasswordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        oldPasswordSeparatorView.topAnchor.constraint(equalTo: oldPasswordTextField.bottomAnchor).isActive = true
        oldPasswordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        oldPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //we need x, y, width, height constraints for NEW PASSWORD TEXT FIELD
        newPasswordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        newPasswordTextField.topAnchor.constraint(equalTo: oldPasswordTextField.bottomAnchor).isActive = true
        newPasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        newPasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
        //we need x, y, width, height constraints for NEW PASSWORD SEPARATOR VIEW
        newPasswordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        newPasswordSeparatorView.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor).isActive = true
        newPasswordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        newPasswordSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //we need x, y, width, height constraints for CONFIRM NEW PASSWORD TEXT FIELD
        confirmNewPasswordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        confirmNewPasswordTextField.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor).isActive = true
        confirmNewPasswordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        confirmNewPasswordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4).isActive = true
        
        
    }
    
    func setupResetConfirmButton(){
        //we need x, y, width, height constraints
        resetConfirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetConfirmButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        resetConfirmButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        resetConfirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
}



