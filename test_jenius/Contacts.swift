//
//  Contacts.swift
//  my_test
//
//  Created by Bimo Satriantoro on 18/06/20.
//  Copyright © 2020 Bimo Satriantoro. All rights reserved.
//

import Foundation

struct DataContact:Decodable {
    var data:[ContactDetail]
}

struct ContactDetail:Decodable {
    var id:String
    var firstName:String
    var lastName:String
    var age:Int
    var photo:String
}
