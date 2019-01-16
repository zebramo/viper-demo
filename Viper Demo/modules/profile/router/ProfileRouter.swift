//
//  ProfileRouter.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 8.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter : ProfilePresenterToRouterProtocol{
    
    var viewController : UIViewController!
    
    static func createModule() -> ProfileVC {
        let presenter :
        ProfileInteractorToPresenterProtocol & ProfileViewToPresenterProtocol = ProfilePresenter()
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        let interactor : ProfilePresenterToInteractorProtocol = ProfileInteractor()
        let router = ProfileRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view
    }
    
    func back() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
