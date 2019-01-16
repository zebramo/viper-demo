//
//  RegisterInteractor.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 2.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class RegisterInteractor:RegisterPresenterToInteractorProtocol{
    
    var presenter : RegisterInteractorToPresenterProtocol?
    
    func performRegisterRequest(forename: String, surname: String, mail: String, password: String) {
        let params : [String:String] =
                    [REGISTER_PARAM_MAIL : mail,
                     REGISTER_PARAM_FORENAME : forename,
                     REGISTER_PARAM_SURNAME : surname,
                     REGISTER_PARAM_PASSWORD : password
                ]
        makeRegisterPostRequest(url: EP_REGISTER, params: params)
    }
    
    func makeRegisterPostRequest(url:String, params :  [String:String]){
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            if response.result.isSuccess{
                let responseJson : JSON = JSON(response.result.value!)
                do {
                    let jsonData = try responseJson.rawData()
                    let userReponse = try JSONDecoder().decode(UserModel.self, from: jsonData)
                    self.presenter?.responseSuccess(user: userReponse)
                }catch _{
                    self.presenter?.responseFailed()
                }
            }else {
                self.presenter?.responseFailed()
            }
        }
    }
    
}
