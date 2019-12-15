//
//  AvatarModel.swift

//  File name: Personal_BMI_Index
//  Author name: Bhavya shah
//  Student Id : 301076681
//  Created by Bhavya Shah on date : 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.


class Avatar{
    var id: String?
    var name: String?
    var weight: String?
    var height: String?
    var bmi: String?
    
    init(id: String?,name: String?,weight: String?, height:String?, bmi:String?) {
        self.id = id;
        self.name = name;
        self.weight = weight;
        self.height = height;
        self.bmi = bmi;
    }
}
