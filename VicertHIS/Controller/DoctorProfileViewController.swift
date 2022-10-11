//
//  DoctorProfileViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit
import FSCalendar



//UITableViewDelegate, UITableViewDataSource
class DoctorProfileViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
  
    private weak var calendar: FSCalendar!
    
    private lazy var stackView: UIStackView = {
        
        let hStackView = makeHorizontalStackView(image: UIImage(named: "doctor2")!, title: doctor.name!)
        let hStackView2 = makeHorizontalStackView(image: UIImage(named: "home1")!, title: doctor.adress!)
        let hStackView3 = makeHorizontalStackView(image: UIImage(named: "email")!, title: doctor.email!)
        let hStackView4 = makeHorizontalStackView(image: UIImage(named: "phone")!, title: doctor.phoneNumber!)
        let hStackView5 = makeHorizontalStackView(image: UIImage(named: "calendar2")!, title: doctor.dateOfBirth!)
        let appointmentStackView = makeAppointmentStackView(title: "Free Appointments")
        let appointmentContent = makeAppointmentContent(content: "Click on the date of the appointment to book it")
      

        var stackView = UIStackView(arrangedSubviews: [hStackView, hStackView2, hStackView3, hStackView4, hStackView5, appointmentStackView, appointmentContent])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.distribution = .fill
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
    let doctor: Doctor
    
    init(doctor: Doctor){
        self.doctor = doctor
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
       
        navigationItem.title = "Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        view.backgroundColor = UIColor(r: 255, g: 226, b: 187)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        //calendar
        let calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: 300, height: 400.0))
        calendar.scrollDirection = .vertical
        calendar.scope = .month
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
        //when we work with cells we need to register it
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
        self.view.addSubview(calendar)
        
        calendar.delegate = self
        calendar.dataSource = self
        
        //select multiple days
        calendar.allowsMultipleSelection = true
        
        //option1: automaticly set constraint for calendar
       // calendar.frame = view.frame
        
        //option2: manualy set constraints for calendar
        //setupCalendar()
        calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 420).isActive = true
        //calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calendar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 44).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: 300).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // *** FONT&COLOR of calendar
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)
        
        calendar.appearance.todayColor = .systemGreen
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleDefaultColor = .systemBlue
        calendar.appearance.weekdayTextColor = .systemRed
        calendar.appearance.headerTitleColor = .systemRed
    }
    
   
   /* func setupCalendar(){
        //setting up constraints
        calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 550).isActive = true
    }*/
       
  
    
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
   
    
    
    
    
    
}


