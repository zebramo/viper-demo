//
//  RegisterRouter.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 2.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import UIKit

class RegisterRouter:RegisterPresenterToRouterProtocol{
    
    var viewController : UIViewController!
    
    func showProfileScreen(user:UserModel) {
        let profileModule = ProfileRouter.createModule()
        profileModule.user = user
        viewController.navigationController?.pushViewController(profileModule,animated: true)
    }
    
    
    static func createModule() -> RegisterVC {
        let presenter : RegisterViewToPresenterProtocol & RegisterInteractorToPresenterProtocol = RegisterPresenter()
        let view = mainstoryboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        let interactor : RegisterPresenterToInteractorProtocol = RegisterInteractor()
        let router = RegisterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
