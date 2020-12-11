//
//  File.swift
//  miniTransForm
//
//  Created by Srinivas Chakravarthi Thandu on 12/10/20.
//  Copyright © 2020 Anju. All rights reserved.
//

import Foundation
struct zalgoCharacters:Codable{
    let above :[String]
    let inline:[String]
    let below:[String]
    init(){
        let url = Bundle.main.url(forResource: "zalgo", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let decoder = JSONDecoder()
        self = try! decoder.decode(zalgoCharacters.self,from: data)
    }
}
