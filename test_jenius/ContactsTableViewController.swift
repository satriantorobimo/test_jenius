//
//  ContactsTableViewController.swift
//  test_jenius
//
//  Created by Bimo Satriantoro on 19/06/20.
//  Copyright © 2020 Bimo Satriantoro. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    var listOfContact = [ContactDetail]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let contactReq = ContactApi(codeReq: "contact", nameEndPoin: "get")
        contactReq.getDataContact{
            [weak self] result in
            switch result{
            case .failure(let error):
                print(error)

            case .success(let contacts):
                self?.listOfContact = contacts
                DispatchQueue.main.async{
                    self?.tableView.reloadData()
                }
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfContact.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
               
        let contacts = listOfContact[indexPath.row]
        let url = URL(string: contacts.photo)
        let dataPhoto = try? Data(contentsOf: url!)
        cell.textLabel?.text = contacts.firstName + " " + contacts.lastName
        cell.detailTextLabel?.text = String(contacts.age)
//        cell.imageView?.image = UIImage(data: dataPhoto!)
        return cell
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
