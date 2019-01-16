//
//  ProfileProtocols.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 8.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//
import UIKit
import Foundation

protocol ProfileViewToPresenterProtocol: class{
    var view : ProfilePresenterToViewProtocol?{get set}
    var interactor : ProfilePresenterToInteractorProtocol? {get set}
    var router : ProfilePresenterToRouterProtocol? {get set}
    
    func getUserProfile(id:String)
    func logOutUser()
}
protocol ProfilePresenterToViewProtocol: class {
    func onResponseSuccess(user:UserModel)
    func showMessage(title:String,message:String)
    func showDialog()
    func hideDialog()
    
}
protocol ProfilePresenterToInteractorProtocol: class{
    var presenter : ProfileInteractorToPresenterProtocol?{ get set }
    func makeUserDetailRequest(id:String)
}
protocol ProfileInteractorToPresenterProtocol: class {
    func responseFailed()
    func responseSuccess(user:UserModel)
}
protocol ProfilePresenterToRouterProtocol: class {
    func back()
}

