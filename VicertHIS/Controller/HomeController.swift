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
        //zelena
        label.textColor = UIColor(r: 108, g: 198, b: 68)
        label.font = .systemFont(ofSize: 15, weight: .bold)
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
        label.textColor = UIColor(r: 108, g: 198, b: 68)
        label.font = .systemFont(ofSize: 15, weight: .bold)
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
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor(r: 108, g: 198, b: 68)
        return label
    }()
    
    let patientLabelInput: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "User name"
        return label
    }()
    
    
    lazy var completeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor(r: 108, g: 198, b: 68)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }()
    
  
    
    func setupViews(){
        
        
        
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
        dayLabelInput.rightAnchor.constraint(equalTo: dayLabel.rightAnchor, constant: 200).isActive = true
        dayLabelInput.heightAnchor.constraint(equalTo: dayImage.heightAnchor).isActive = true
        dayLabelInput.rightAnchor.constraint(equalTo: completeButton.leftAnchor).isActive = true
        
      
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
        patientLabelInput.rightAnchor.constraint(equalTo: completeButton.leftAnchor).isActive = true
        patientLabelInput.centerYAnchor.constraint(equalTo: patientImage.centerYAnchor).isActive = true
        patientLabelInput.topAnchor.constraint(equalTo: startTimeInput.bottomAnchor, constant: 5).isActive = true
        patientLabelInput.heightAnchor.constraint(equalTo: patientImage.heightAnchor).isActive = true
        
    
        completeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        completeButton.leftAnchor.constraint(equalTo: startTimeInput.rightAnchor).isActive = true
        completeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        completeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        completeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class HomeController: UITableViewController {
    
   
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController!.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white ]
     
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
       
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        view.backgroundColor = UIColor(r: 240, g: 255, b: 240)
    }
    
    
    //GRADIENT
  /*  func applyGradient()
        {

            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = tableView.bounds
           
            //[UIColor(r: 17, g: 28, b: 60).cgColor, UIColor(r: 17, g: 28, b: 500).cgColor]
            gradientLayer.colors = [UIColor(r: 17, g: 28, b: 187).cgColor, UIColor(r: 255, g: 153, b: 255).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)

            let backgroundView = UIView(frame: tableView.bounds)
            backgroundView.layer.insertSublayer(gradientLayer, at: 0)

            tableView.backgroundView = backgroundView
        }
      
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            applyGradient()
        } */
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
        cell.backgroundColor = .clear
        
        
        if let day = appointments[indexPath.item].date{
            cell.dayLabelInput.text = day
            cell.dayLabelInput.textColor = .black
            cell.dayLabelInput.font = .systemFont(ofSize: 16, weight: .medium)
        }
        if let startTime = appointments[indexPath.item].startTime{
            cell.startTimeInput.text = startTime
            cell.startTimeInput.textColor = .black
            cell.startTimeInput.font = .systemFont(ofSize: 16, weight: .heavy)
        }
        if let patient = appointments[indexPath.item].patient{
            cell.patientLabelInput.text = patient
            cell.patientLabelInput.textColor = .black
            cell.patientLabelInput.font = .systemFont(ofSize: 16, weight: .medium)
        }
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
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
