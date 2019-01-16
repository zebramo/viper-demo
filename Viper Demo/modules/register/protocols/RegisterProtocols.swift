//
//  RegisterProtocols.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 2.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//
import Foundation
import UIKit
//
protocol RegisterViewToPresenterProtocol:class{
    var view : RegisterPresenterToViewProtocol?{get set}
    var interactor : RegisterPresenterToInteractorProtocol?{get set}
    var router : RegisterPresenterToRouterProtocol?{get set}
    // viewToPresenter methods
    func clickSubmit(name:String,lastName:String,mail:String,password:String)
}

protocol RegisterInteractorToPresenterProtocol:class{
    func responseFailed()
    func responseSuccess(user:UserModel)
}

protocol RegisterPresenterToViewProtocol:class{
    func showWarningMessage(title:String,message:String)
    func showLoading()
    func hideLoading()
}

protocol RegisterPresenterToRouterProtocol:class{
    static func createModule()-> RegisterVC
    func showProfileScreen(user :UserModel)
}



protocol RegisterPresenterToInteractorProtocol:class{
    var presenter : RegisterInteractorToPresenterProtocol?{get set}
    func performRegisterRequest(forename:String,surname:String,mail:String,password:String)
    //responseSuccess()
    //responseFail
}


