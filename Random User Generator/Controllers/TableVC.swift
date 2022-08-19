//
//  ViewController.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 18/08/2022.
//

import UIKit

class TableVC: UIViewController {

    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var segmentedControlFilter: UISegmentedControl?
    
    
    var users: [User] = [] {
            didSet {
                tableView?.reloadData()
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        retrieveUsers()
    }
    
    func retrieveUsers(){
        APIRequest.shared.retrieveUsers { users, error in
            if let users = users {
                self.users = users
            }
        }
    }
    
    
    @IBAction func btnRemoveFilter(_ sender: Any) {
        
    }
    

}

extension TableVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PersonDetailSegue", sender: self)
        retrieveUsers()
        
    }
}

extension TableVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell
        let person = users[indexPath.row]
        customCell?.lblPersonName?.text = "\(person.name?.first ?? "") \(person.name?.last ?? "")"
        return customCell!
    }
    
    
}

