//
//  CreateDoctorController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 20.10.22..
//

import UIKit

class CreateDoctorController: UITableViewController {
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        return cell
    }




}
