//
//  DoctorProfileViewController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit

//UITableViewDelegate, UITableViewDataSource
class DoctorProfileViewController: UIViewController   {
    
    
  /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(doctors[indexPath.row])
    }
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "cellId")
        return table
    }() */
    
   // let doctors: [Doctor] = []
    
 /*  init(doctors: [Doctor]){
        self.doctors = doctors
        super.init(nibName: nil, bundle: nil)
    } */
    
    /*required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } */
    
    var user: Doctor? {
        didSet {
            navigationItem.title = user?.name
            
            loadData()
        }
    }
    
    
   
    
    func loadData(){
        
        print(123)
        
    }
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(tableView)
        //tableView.delegate = self
        //tableView.dataSource = self
       
        navigationItem.title = "Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        view.backgroundColor = UIColor(r: 255, g: 226, b: 187)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
       
    }
  
    
    
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
   
    
    
    
    
    
}


