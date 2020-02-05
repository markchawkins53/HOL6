//
//  ViewController.swift
//  HOL6
//
//  Created by Mark Hawkins on 2/5/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

struct Defaults{
         
    static let (nameKey, addressKey) = ("name", "address")
    static let userSessionKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard
         
        /**
       - Description - It's using for the passing and fetching user values from the UserDefaults.
         */
    struct UserDetails {
        let name: String
        let address: String
         
        init(_ json: [String: String]) {
            self.name = json[nameKey] ?? ""
            self.address =  json[addressKey] ?? ""
        }
    }
         
        /**
-    Description - Saving user details
-    Inputs - name `String` & address `String`
         */
    static func save(_ name: String, address: String) {
        userDefault.set([nameKey: name, addressKey: address], forKey: userSessionKey)
    }
         
        /**
-    Description - Fetching Values via Model `UserDetails` you can use it      based on your uses.
-    Output - `UserDetails` model
         */
    static func getNameAndAddress() -> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
    }
         
        /**
-    Description - Clearing user details for the user key
    `com.save.usersession`
         */
    static func clearUserData(){
        userDefault.removeObject(forKey: userSessionKey)
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet var nameInput:UITextField!
    @IBOutlet var addressInput:UITextField!
    
    @IBOutlet var nameOutput:UILabel!
    @IBOutlet var addressOutput:UILabel!
    
    @IBAction func clearData () {
        Defaults.clearUserData()
        nameOutput.text! = ""
        addressOutput.text! = ""
    }
    
    @IBAction func saveData () {
        Defaults.save(nameInput.text!, address: addressInput.text!)
        nameOutput.text! = Defaults.getNameAndAddress().name
        addressOutput.text! = Defaults.getNameAndAddress().address
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

