//
//  FindCareController.swift
//  VicertHIS
//
//  Created by Ana Miloradovic on 7.10.22..
//

import UIKit

class FindCareController: UITableViewController {
    
    let cellId = "cellId"
    
    let doctors: [Doctor] = {
        
        let doctor1 = Doctor(name: "Kaiden Sidney", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "May 17, 1979", phoneNumber: "123-123-1234", email: "kaiden.sidney@vhis.com")
        let doctor2 = Doctor(name: "Cornell Ellison", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jan 29, 1974", phoneNumber: "123-123-1234", email: "cornell.ellison@vhis.com")
        let doctor3 = Doctor(name: "Douglas Loman", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jun 11, 1978", phoneNumber: "123-123-1234", email: "douglas.loman@vhis.com")
        let doctor4 = Doctor(name: "Virginia Apgar", adress: "350 Fifth Avenue, Manhattan, New York, 10118", dateOfBirth: "Jan 01, 1970", phoneNumber: "123-1234-123", email: "virginia.apgar@vhis.com")
        return [doctor1, doctor2, doctor3, doctor4]
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 254, g: 234, b: 230)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.systemPurple
        
        navigationItem.title = "Doctors"
        navigationItem.titleView?.tintColor = UIColor(r: 68, g: 44, b: 46)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(DoctorsCell.self, forCellReuseIdentifier: cellId)

    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DoctorsCell
       cell.backgroundColor = .clear
       
       if let name = doctors[indexPath.item].name{
           cell.doctorsName.text = name
       }
       
       if let adress = doctors[indexPath.item].adress {
           cell.adressLabel.text = adress
       }
       
       if let birth = doctors[indexPath.item].dateOfBirth{
           cell.birthLabel.text = birth
       }
       
       if let phone = doctors[indexPath.item].phoneNumber{
           cell.phoneLabel.text = phone
       }
       
       if let email = doctors[indexPath.item].email{
           cell.emailLabel.text = email
       }
       
        return cell
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }

    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctorController = DoctorProfileViewController()
        present(doctorController, animated: true)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
