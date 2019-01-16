//
//  RegisterPresenter.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 2.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import UIKit


class RegisterPresenter:RegisterViewToPresenterProtocol{
    

    var view : RegisterPresenterToViewProtocol?
    var interactor : RegisterPresenterToInteractorProtocol?
    var router : RegisterPresenterToRouterProtocol?
    
  
    func clickRegister(name:String,lastName:String,mail:String,password:String){
        if name.isEmpty || lastName.isEmpty || mail.isEmpty || password.isEmpty{
            view?.showWarningMessage(title: "Warning", message: "Please fill all fields.")
        }else {
            self.view?.showLoading()
            interactor?.performRegisterRequest(forename: name, surname: lastName, mail: mail, password: password)
        }
    }
}

extension RegisterPresenter:RegisterInteractorToPresenterProtocol{
    
    func responseFailed() {
        self.view?.hideLoading()
        view?.showWarningMessage(title: "Error", message: "There is an error please try again later.")
    }
    
    func responseSuccess(user: UserModel) {
        self.view?.hideLoading()
        router?.showProfileScreen(user: user)
    }
    
    
}
