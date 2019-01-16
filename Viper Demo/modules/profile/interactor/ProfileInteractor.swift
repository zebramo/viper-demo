//
//  ProfileInteracotr.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 8.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class ProfileInteractor : ProfilePresenterToInteractorProtocol{
    
    var presenter: ProfileInteractorToPresenterProtocol?
    
    func makeUserDetailRequest(id: String) {
        let url = EP_GET_USER_DETAIL + id
        makeRegisterPostRequest(url: url)
    }
    
    func makeRegisterPostRequest(url:String){
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess{
                let responseJson : JSON = JSON(response.result.value!)
                do {
                    //parsing response
                  //  self.presenter?.responseSuccess(user: nil)
                }catch _{
                   // self.presenter?.responseFailed()
                }
            }else {
               // self.presenter?.responseFailed()
            }
        }
    }
    
}
