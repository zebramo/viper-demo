//
//  UserModel.swift
//  Viper Demo
//
//  Created by Samet Gundogmus on 7.01.2019.
//  Copyright © 2019 Samet Gundogmus. All rights reserved.
//

import Foundation
import ObjectMapper


private let ID = "id"
private let E_MAIL = "email"
private let FORENAME = "forename"
private let SURNAME = "surname"

class UserModel : Decodable{
    
    internal var id:String?
    internal var email:String?
    internal var forename:String?
    internal var surname:String?
    internal var password:String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map[ID]
        email <- map[E_MAIL]
        forename <- map[FORENAME]
        surname <- map[SURNAME]
    }
    
    
}
