//
//  LoginViewController.swift
//  iosImageProject
//
//  Created by Whitney Lauren on 6/19/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(sender: UIButton) {
        
        RailsRequest.session().username = usernameField.text
        RailsRequest.session().password = passwordField.text
        
        RailsRequest.session().loginWithCompletion { () -> Void in
            
            self.goToProfileVC()
        }
        
    }
    
    func goToProfileVC() {
        var profileVC = self.storyboard?.instantiateViewControllerWithIdentifier("profileVC")
            as! ProfileViewController
        
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @IBAction func registerButton(sender: UIButton) {
        
        
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
