//
//  AvatarModel.swift
//  Personal_BMI_Index
//
//  Created by Bhavya Shah on 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.
//

class Avatar{
    var id: Int?
    var name: String?
    var weight: Float?
    var height: Float?
    var bmi: Float?
    
    init(id: Int?,name: String?,weight: Float?, height:Float?, bmi:Float?) {
        self.id = id;
        self.name = name;
        self.weight = weight;
        self.height = height;
        self.bmi = bmi;
    }
}
