//
//  RegisterVC.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 2.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import UIKit

class RegisterVC:BaseVC{

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfMail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var presenter:RegisterViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInit()
    }
    
    func uiInit(){
        self.title = "Register"
        setDoneOnKeyboard()
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(RegisterVC.clickDoneButton))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.tfName.inputAccessoryView = keyboardToolbar
        self.tfLastName.inputAccessoryView = keyboardToolbar
        self.tfMail.inputAccessoryView = keyboardToolbar
        self.tfPassword.inputAccessoryView = keyboardToolbar
    }
    
    @objc func clickDoneButton(){
        //presenter!.hideKeyboard(view: view)
        view.endEditing(true)
    }
    @IBAction func clickSubmit(_ sender: UIButton) {
        presenter!.clickRegister(name: self.tfName.text!,
                               lastName: self.tfLastName.text!,
                               mail: self.tfMail.text!,
                               password: self.tfPassword.text!)
    }
    
    
}

extension RegisterVC:RegisterPresenterToViewProtocol{
    
    func showWarningMessage(title:String,message: String) {
        showMessageWithOkButton(title: title, message: message)
    }
}
