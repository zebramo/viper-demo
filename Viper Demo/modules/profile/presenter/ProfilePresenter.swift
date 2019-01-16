//
//  ProfilePresenter.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 8.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import UIKit

class ProfilePresenter : ProfileViewToPresenterProtocol{
    
    var router: ProfilePresenterToRouterProtocol?
    var view: ProfilePresenterToViewProtocol?
    var interactor: ProfilePresenterToInteractorProtocol?
    
    func getUserProfile(id: String) {
        interactor?.makeUserDetailRequest(id: id)
    }
    
    func logOutUser() {
        router?.back()
    }
    
}


extension ProfilePresenter : ProfileInteractorToPresenterProtocol{
    
    func responseFailed() {
        view?.hideDialog()
        view?.showMessage(title: "Error", message: "There is an error, please try again later")
    }
    
    func responseSuccess(user: UserModel) {
        view?.hideDialog()
        view?.onResponseSuccess(user: user)
    }
    
    
}
