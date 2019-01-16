//
//  ProfileVC.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 8.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import UIKit

class ProfileVC: BaseVC {
   
    @IBOutlet weak var labelFullName: UILabel!
    @IBOutlet weak var labelMail: UILabel!
    
    var presenter:ProfileViewToPresenterProtocol?
    var user : UserModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUi()
      //presenter?.getUserProfile(id: (user?.id)!)  Normally we make user detail request but for this sample project we are goint to use local user object.
        onResponseSuccess(user: user!)
    }
    
    func initUi(){
        self.title = "Profile"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func clickLogOut(_ sender: UIButton) {
        presenter?.logOutUser()
    }
   
}

extension ProfileVC : ProfilePresenterToViewProtocol{
    
    func onResponseSuccess(user: UserModel) {
        labelFullName.text = user.forename! + " " + user.surname!
        labelMail.text = user.email
    }
    
    func onResponseFailed() {
        showMessageWithOkButton(title: "Warning", message: "There is an error please try again later")
    }
    
    func showMessage(title: String, message: String) {
        showMessage(title: title, message: message)
    }
    
    func showDialog() {
        showLoading()
    }
    
    func hideDialog() {
        hideDialog()
    }
}
