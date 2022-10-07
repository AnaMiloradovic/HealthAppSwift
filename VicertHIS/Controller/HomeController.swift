//
//  HomeController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 4.10.22..
//

import UIKit



//let dates = [ "Jan 01. 2022", "Mar 18. 2022", "May 21. 2022", "Nov 15. 2022"]
//let startTimes = ["04:00 PM", "02:30 PM", "12:30 PM", "09:30 AM"]

let appointments: [Appoitments] = {
    
    let app1 = Appoitments(date: "Jan 22. 2022", startTime: "09:00 PM", patient: "User name")
    let app2 = Appoitments(date: "Mar 18. 2022", startTime: "02:30 PM", patient: "User name")
    let app3 = Appoitments(date: "May 21. 2022", startTime: "12:30 PM", patient: "User name")
    let app4 = Appoitments(date: "Nov 15. 2022", startTime: "09:30 AM", patient: "User name")
    return [app1, app2, app3, app4]
}()


class UserCell: UITableViewCell{
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    let dayImage: UIImageView = {
        
         let imageView = UIImageView(image: UIImage(named: "calendar2"))
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
         imageView.isUserInteractionEnabled = true
         return imageView
     }()
    
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Day:"
        return label
    }()
    
    
    let dayLabelInput: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Jan 01. 2022"
        return label
    }()
    
    
    let startTimeImage: UIImageView = {
         let imageView = UIImageView(image: UIImage(named: "time3"))
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
         imageView.isUserInteractionEnabled = true
         return imageView
     }()
    

    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Start time:"
        return label
    }()
    
    let startTimeInput: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "04:00 PM"
        return label
    }()
    
    
    let patientImage: UIImageView = {
         let imageView = UIImageView(image: UIImage(named: "profile2"))
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFill
         imageView.isUserInteractionEnabled = true
         return imageView
     }()
    
    
    let patientLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Patient:"
        return label
    }()
    
    let patientLabelInput: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "User name"
        return label
    }()
    
    
    let completeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.systemPurple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }()
    
    func setupViews(){
        
        backgroundColor = .yellow
        
        addSubview(dayImage)
        addSubview(dayLabel)
        addSubview(dayLabelInput)
        addSubview(startTimeImage)
        addSubview(startTimeLabel)
        addSubview(startTimeInput)
        addSubview(patientImage)
        addSubview(patientLabel)
        addSubview(patientLabelInput)
        addSubview(completeButton)
        
       
        dayImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        dayImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        dayImage.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor).isActive = true
        dayImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        dayImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        dayLabel.leftAnchor.constraint(equalTo: dayImage.rightAnchor, constant: 8).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: dayImage.centerYAnchor).isActive = true
        dayLabel.rightAnchor.constraint(equalTo: dayLabelInput.leftAnchor).isActive = true
        dayLabel.heightAnchor.constraint(equalTo: dayImage.heightAnchor).isActive = true
        
        dayLabelInput.leftAnchor.constraint(equalTo: dayLabel.rightAnchor).isActive = true
        dayLabelInput.centerYAnchor.constraint(equalTo: dayImage.centerYAnchor).isActive = true
       // dayLabelInput.rightAnchor.constraint(equalTo: completeButton.leftAnchor).isActive = true
        dayLabelInput.heightAnchor.constraint(equalTo: dayImage.heightAnchor).isActive = true
        
        startTimeImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        startTimeImage.topAnchor.constraint(equalTo: dayImage.bottomAnchor, constant: 5).isActive = true
        startTimeImage.widthAnchor.constraint(equalTo: dayImage.widthAnchor).isActive = true
        startTimeImage.heightAnchor.constraint(equalTo: dayImage.heightAnchor).isActive = true
       
        
        startTimeLabel.leftAnchor.constraint(equalTo: startTimeImage.rightAnchor, constant: 8).isActive = true
        startTimeLabel.centerYAnchor.constraint(equalTo: startTimeImage.centerYAnchor).isActive = true
        startTimeLabel.rightAnchor.constraint(equalTo: startTimeInput.leftAnchor).isActive = true
        startTimeLabel.heightAnchor.constraint(equalTo: startTimeImage.heightAnchor).isActive = true
        
        startTimeInput.leftAnchor.constraint(equalTo: startTimeLabel.rightAnchor).isActive = true
        startTimeInput.rightAnchor.constraint(equalTo: completeButton.leftAnchor).isActive = true
        //startTimeInput.centerYAnchor.constraint(equalTo: startTimeImage.centerYAnchor).isActive = true
        startTimeImage.topAnchor.constraint(equalTo: dayLabelInput.bottomAnchor, constant: 5).isActive = true
        startTimeInput.heightAnchor.constraint(equalTo: startTimeImage.heightAnchor).isActive = true
        
        
        patientImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        patientImage.topAnchor.constraint(equalTo: startTimeImage.bottomAnchor, constant: 5).isActive = true
        patientImage.widthAnchor.constraint(equalTo: startTimeImage.widthAnchor).isActive = true
        patientImage.heightAnchor.constraint(equalTo: startTimeImage.heightAnchor).isActive = true
       
        patientLabel.leftAnchor.constraint(equalTo: patientImage.rightAnchor, constant: 8).isActive = true
        patientLabel.centerYAnchor.constraint(equalTo: patientImage.centerYAnchor).isActive = true
        patientLabel.rightAnchor.constraint(equalTo: patientLabelInput.leftAnchor).isActive = true
        patientLabel.heightAnchor.constraint(equalTo: patientImage.heightAnchor).isActive = true
        
        
        patientLabelInput.leftAnchor.constraint(equalTo: patientLabel.rightAnchor).isActive = true
        //patientLabelInput.rightAnchor.constraint(equalTo: completeButton.leftAnchor).isActive = true
        patientLabelInput.centerYAnchor.constraint(equalTo: patientImage.centerYAnchor).isActive = true
        patientLabelInput.topAnchor.constraint(equalTo: startTimeInput.bottomAnchor, constant: 5).isActive = true
        patientLabelInput.heightAnchor.constraint(equalTo: patientImage.heightAnchor).isActive = true
        
        
        
        completeButton.topAnchor.constraint(equalTo: dayLabelInput.bottomAnchor, constant: 15).isActive = true
        completeButton.leftAnchor.constraint(equalTo: dayLabelInput.rightAnchor, constant: -15).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        completeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        //completeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeController: UITableViewController {
    
   
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = UIColor(r: 255, g: 251, b: 230)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPurple
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
       
    }
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        cell.backgroundColor = .clear
        if let day = appointments[indexPath.item].date{
            cell.dayLabelInput.text = day
        }
        if let startTime = appointments[indexPath.item].startTime{
            cell.startTimeInput.text = startTime
        }
        if let patient = appointments[indexPath.item].patient{
            cell.patientLabelInput.text = patient
        }
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
   

}
