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
    @IBOutlet var lblPersonGenderTitle: UILabel?
    @IBOutlet var lblPersonGender: UILabel?
    @IBOutlet var lblPersonBirthdate: UILabel?
    @IBOutlet var lblPersonBirthdateTitle: UILabel?
    @IBOutlet var lblPersonEmailTitle: UILabel?
    @IBOutlet var lblPersonEmail: UILabel?
    @IBOutlet var lblPersonPhoneTitle: UILabel?
    @IBOutlet var lblPersonPhone: UILabel?
    @IBOutlet var lblPersonAddressTitle: UILabel?
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
        lblPersonEmailTitle?.text = "\(user!.name?.first ?? "")'s email"
        lblPersonPhone?.text = user?.phone
        lblPersonPhoneTitle?.text = "\(user!.name?.first ?? "")'s phone"
        lblPersonGender?.text = user?.gender?.capitalized
        lblPersonGenderTitle?.text = "\(user!.name?.first ?? "")'s gender"
        lblPersonAddress?.text = "\(user!.location?.street?.name ?? "") \(user!.location?.street?.number ?? 0), \(user!.location?.city ?? ""), \(user!.location?.state ?? ""), \(user!.location?.country ?? "")"
        lblPersonAddressTitle?.text = "\(user!.name?.first ?? "")'s address"
        lblPersonBirthdate?.text = "\(user!.dob?.date ?? Date()),  \(user!.dob?.age ?? 0) years old."
        lblPersonBirthdateTitle?.text = "\(user!.name?.first ?? "")'s birthdate"
        pullView?.layer.cornerRadius = 5
    }
    
}
