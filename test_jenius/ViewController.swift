//
//  ViewController.swift
//  my_test
//
//  Created by Bimo Satriantoro on 17/06/20.
//  Copyright © 2020 Bimo Satriantoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewController: UITableViewController!
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
            }
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return listOfContact.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let contacts = listOfContact[indexPath.row]
        
        cell.textLabel?.text = contacts.firstName + " " + contacts.lastName
        cell.detailTextLabel?.text = String(contacts.age)
        
        return cell
    }
}
