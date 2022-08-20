//
//  ViewController.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 18/08/2022.
//

import UIKit
import Kingfisher

class TableVC: UIViewController {
    
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var segmentedControlFilter: UISegmentedControl?
    @IBOutlet var removeFilterBtnView: UIView!
    
    
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
        removeFilterBtnView.layer.cornerRadius = 6
    }
    
    func retrieveUsers(){
        APIRequest.shared.retrieveUsers { users, error in
            if let users = users {
                self.users = users
            }
        }
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
//        switch segmentedControlFilter?.selectedSegmentIndex{
//        case 0: APIRequest.shared.url = APIRequest.shared.urlMale
//            retrieveUsers()
//        case 1: APIRequest.shared.url = APIRequest.shared.urlFemale
//            retrieveUsers()
//        default: print("Unknown segment")
//        }
    }
    
    @IBAction func btnRemoveFilter(_ sender: Any) {
//        APIRequest.shared.url = APIRequest.shared.urlAfterFilter
//        retrieveUsers()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PersonDetailSegue"{
            guard let personDetailVC = segue.destination as? PersonDetailVC else { return }
            guard let indexPath = tableView?.indexPathForSelectedRow else { return }
            let user = users[indexPath.row]
            personDetailVC.user = user
        }
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
        customCell?.personImageView?.kf.setImage(with: URL(string: person.picture?.thumbnail ?? ""))
        customCell?.personImageView?.layer.cornerRadius = 25
        return customCell!
    }
    
    
}

