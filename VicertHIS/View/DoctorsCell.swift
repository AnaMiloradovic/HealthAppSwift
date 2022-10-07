//
//  DoctorsCell.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit

class DoctorsCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let doctorsName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(r: 68, g: 44, b: 46)
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    let adressImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "adress"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(r: 68, g: 44, b: 46)
        return label
    }()
    
    let birthImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "birth"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let birthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(r: 68, g: 44, b: 46)
        return label
    }()
    
    let phoneImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "phone"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(r: 68, g: 44, b: 46)
        return label
    }()
    
    let emailImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "email"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .natural
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(r: 68, g: 44, b: 46)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    func setupViews(){
        
        backgroundColor = .magenta
        
        addSubview(doctorsName)
        addSubview(adressImage)
        addSubview(adressLabel)
        addSubview(birthImage)
        addSubview(birthLabel)
        addSubview(phoneImage)
        addSubview(phoneLabel)
        addSubview(emailImage)
        addSubview(emailLabel)
        
        
        doctorsName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        doctorsName.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 5).isActive = true
        doctorsName.widthAnchor.constraint(equalToConstant: 50).isActive = true
        doctorsName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adressImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        adressImage.topAnchor.constraint(equalTo: doctorsName.bottomAnchor, constant: 5).isActive = true
        adressImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
        adressImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        adressImage.rightAnchor.constraint(equalTo: adressLabel.leftAnchor).isActive = true
        
        adressLabel.leftAnchor.constraint(equalTo: adressImage.rightAnchor).isActive = true
        adressLabel.centerYAnchor.constraint(equalTo: adressImage.centerYAnchor).isActive = true
        adressLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        adressLabel.heightAnchor.constraint(equalTo: adressImage.heightAnchor).isActive = true
       
        
        birthImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        birthImage.topAnchor.constraint(equalTo: adressImage.bottomAnchor, constant: 5).isActive = true
        birthImage.widthAnchor.constraint(equalTo: adressImage.widthAnchor).isActive = true
        birthImage.heightAnchor.constraint(equalTo: adressImage.heightAnchor).isActive = true
        birthImage.rightAnchor.constraint(equalTo: birthLabel.leftAnchor).isActive = true
       
        
        birthLabel.leftAnchor.constraint(equalTo: birthImage.rightAnchor).isActive = true
        birthLabel.centerYAnchor.constraint(equalTo: birthImage.centerYAnchor).isActive = true
        birthLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        birthLabel.heightAnchor.constraint(equalTo: birthImage.heightAnchor).isActive = true
    
        
        phoneImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        phoneImage.topAnchor.constraint(equalTo:birthImage.bottomAnchor, constant: 5).isActive = true
        phoneImage.widthAnchor.constraint(equalTo: birthImage.widthAnchor).isActive = true
        phoneImage.heightAnchor.constraint(equalTo: birthImage.heightAnchor).isActive = true
        phoneImage.rightAnchor.constraint(equalTo: phoneLabel.leftAnchor).isActive = true
       
        
        phoneLabel.leftAnchor.constraint(equalTo: phoneImage.rightAnchor, constant: 8).isActive = true
        phoneLabel.centerYAnchor.constraint(equalTo: phoneImage.centerYAnchor).isActive = true
        phoneLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        
        
        emailImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        emailImage.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: 5).isActive = true
        emailImage.widthAnchor.constraint(equalTo: phoneImage.widthAnchor).isActive = true
        emailImage.heightAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        emailImage.rightAnchor.constraint(equalTo: emailLabel.leftAnchor).isActive = true
       
        emailLabel.leftAnchor.constraint(equalTo: emailImage.rightAnchor, constant: 8).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: emailImage.centerYAnchor).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalTo: emailImage.heightAnchor).isActive = true
        
        
       
    }
        
        
}
