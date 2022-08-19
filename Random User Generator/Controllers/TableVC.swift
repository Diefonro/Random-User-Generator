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
    
    let testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
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
        return testArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)

        return customCell
    }
    
    
}

