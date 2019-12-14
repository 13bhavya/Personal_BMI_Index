//
//  SecondViewController.swift
//  File name: Personal_BMI_Index
//  Author name: Bhavya shah
//  Student Id : 301076681
//  Created by Bhavya Shah on date : 2019-12-11.
//  Copyright © 2019 Bhavya Shah. All rights reserved.


import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var ref: DatabaseReference!
    //var myIndex = 0
    var avatarlist = [Avatar]()

    var weight = ""
    var height = ""
    var bmindex = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        avatarlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewControllerTableViewCell
        
        let avatar: Avatar
        
        avatar = avatarlist [indexPath.row]
        //cell.showTask.text = avatar.weight
        return cell
    }

    
    @IBOutlet weak var myTableView: UITableView!

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            let currentIndex:String = avatarlist[indexPath.row].id ?? ""
//            print(currentIndex)
//            ref.child(currentIndex).removeValue()
//            avatarlist.remove(at: indexPath.row)
//            myTableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewData()
    }

    func viewData() {
        self.avatarlist = [Avatar]()
        ref.observeSingleEvent(of: .value) { (snapshots) in
                   for case let snapshot as DataSnapshot in snapshots.children{
                    let id = snapshot.key as? Int
                       let value = snapshot.value as? NSDictionary
                    let name = value?["name"] as? String ?? ""
                       let weigh = value?["weigh"] as? Float
                       let heigh = value?["heigh"] as? Float
                    let bmiIndex = value?["bmi"] as? Float
                    let avatarObj = Avatar(id: id, name: name, weight: weigh, height: heigh, bmi: bmiIndex)
                       self.avatarlist.append(avatarObj)
                       self.myTableView.reloadData()
                   }
               }
    }

}

