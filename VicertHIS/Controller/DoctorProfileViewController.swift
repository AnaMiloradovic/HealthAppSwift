//
//  DoctorProfileViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit
import FSCalendar



class DoctorProfileViewController: UIViewController {
    
  
    private weak var calendar: FSCalendar!
    
    private lazy var stackView: UIStackView = {
        
        let hStackView = makeHorizontalStackView(image: UIImage(named: "doctor2")!, title: result.firstName + " " + result.lastName )
       // let hStackView2 = makeHorizontalStackView(image: UIImage(named: "home1")!, title: doctor.adress!)
        let hStackView2 = makeHorizontalStackView(image: UIImage(named: "home1")!, title: result.address)
        let hStackView3 = makeHorizontalStackView(image: UIImage(named: "email")!, title: result.email)
        let hStackView4 = makeHorizontalStackView(image: UIImage(named: "phone")!, title: result.phone)
        let hStackView5 = makeHorizontalStackView(image: UIImage(named: "calendar2")!, title: result.dateOfBirth.convertDateString())
        let appointmentStackView = makeAppointmentStackView(title: "Free Appointments")
        let appointmentContent = makeAppointmentContent(content: "Click on the date of the appointment to book it")
      

        var stackView = UIStackView(arrangedSubviews: [hStackView, hStackView2, hStackView3, hStackView4, hStackView5, appointmentStackView, appointmentContent])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.contentMode = .scaleAspectFit
        stackView.setCustomSpacing(35.0, after: hStackView5)
        stackView.setCustomSpacing(12, after: appointmentStackView)
        
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
    
    private func makeAppointmentStackView(title: String) -> UIStackView {
        let appointmentLabel = UILabel()
        appointmentLabel.text = title
        appointmentLabel.font = .systemFont(ofSize: 20, weight: .bold)
        let stackView = UIStackView(arrangedSubviews: [appointmentLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        
        return stackView
    }
    
    private func makeAppointmentContent(content: String) -> UIStackView {
        let appointmentContent = UILabel()
        appointmentContent.text = content
        appointmentContent.font = .systemFont(ofSize: 14, weight: .light)
        appointmentContent.translatesAutoresizingMaskIntoConstraints = false
       
        let stackView = UIStackView(arrangedSubviews: [appointmentContent])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10.0
        
        return stackView
    }
    
    
    //sta vracamo
    
    
    let result: DoctorsResults
    
    init(result: DoctorsResults){
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    let doctor: Doctor
    
    init(doctor: Doctor){
        self.doctor = doctor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     */
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
       
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
       
        navigationItem.title = "Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        view.backgroundColor = UIColor(r: 255, g: 255, b: 240)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        setupCalendar()
        
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


// Calendar
extension DoctorProfileViewController : FSCalendarDataSource, FSCalendarDelegate{
    
    func setupCalendar(){
        
        //calendar
        let calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: 300, height: 400.0))
        calendar.scrollDirection = .vertical
        calendar.scope = .month
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        //when we work with cells we need to register it
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        view.addSubview(calendar)
        
        calendar.delegate = self
        calendar.dataSource = self
        
        //select multiple days
        calendar.allowsMultipleSelection = true
        
        //option1: automaticly set constraint for calendar
       // calendar.frame = view.frame
        
        //option2: manualy set constraints for calendar
        calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 430).isActive = true
        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: 300).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 200).isActive = true
    
        
        // *** FONT&COLOR of calendar
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17, weight: .light)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        
        calendar.appearance.todayColor = .systemGreen
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .systemBlue
        calendar.appearance.weekdayTextColor = .systemOrange
        calendar.appearance.headerTitleColor = .systemOrange
        
    }

}


