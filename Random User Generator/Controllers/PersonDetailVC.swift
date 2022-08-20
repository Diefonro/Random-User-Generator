//
//  PersonDetailVC.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 18/08/2022.
//

import UIKit

class PersonDetailVC: UIViewController {

    @IBOutlet var pullView: UIView?
    @IBOutlet var lblPersonName: UILabel?
    @IBOutlet var personImage: UIImageView?
    @IBOutlet var lblPersonGender: UILabel?
    @IBOutlet var lblPersonBirthdate: UILabel?
    @IBOutlet var lblPersonEmail: UILabel?
    @IBOutlet var lblPersonPhone: UILabel?
    @IBOutlet var lblPersonAddress: UILabel?
    
    var user: User? {
        didSet {
            updateInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }
    

    
    func updateInfo(){
        lblPersonName?.text = "\(user!.name?.first ?? "") \(user!.name?.last ?? "")"
        personImage?.kf.setImage(with: URL(string: user?.picture?.large ?? ""))
        lblPersonEmail?.text = user?.email
        lblPersonPhone?.text = user?.phone
        lblPersonGender?.text = user?.gender
        lblPersonAddress?.text = "\(user!.location?.street?.name ?? "") \(user!.location?.street?.number ?? 0), \(user!.location?.city ?? ""), \(user!.location?.state ?? ""), \(user!.location?.country ?? "")"
        lblPersonBirthdate?.text = "\(user!.dob?.date ?? Date()),  \(user!.dob?.age ?? 0) years old."
        pullView?.layer.cornerRadius = 5
    }
    
}
