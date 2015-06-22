//
//  ProfileViewController.swift
//  iosImageProject
//
//  Created by Whitney Lauren on 6/19/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func playButton(sender: UIButton) {
        
        let playgameVC = self.storyboard?.instantiateViewControllerWithIdentifier("playgameVC")
            as! PlayGameViewController
        
//        self.presentViewController(playgameVC, animated: false, completion: nil)
        self.navigationController?.pushViewController(playgameVC, animated: true)
    }
    
    
    @IBAction func logoutButton(sender: UIButton) {

        self.navigationController?.popToRootViewControllerAnimated(true)
//        var loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC")
//            as! ProfileViewController
//        
//        self.presentViewController(loginVC, animated: false, completion: nil)
    }
    
    @IBAction func postButton(sender: UIButton) {
        
        let cameraVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraVC") as! ViewController
        
        self.navigationController?.pushViewController(cameraVC, animated: true)
        
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var topscoreLabel: UILabel!
    
    
    

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
