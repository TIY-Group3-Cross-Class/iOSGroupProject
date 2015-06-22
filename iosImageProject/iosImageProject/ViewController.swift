//
//  ViewController.swift
//  iosImageProject
//
//  Created by Aimee Bragg on 6/17/15.
//  Copyright (c) 2015 Aimee Bragg. All rights reserved.
//

import UIKit
import AFNetworking
import AFAmazonS3Manager

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        imagePicker.delegate = self
//        imagePicker.sourceType = .Camera
//        
//        dispatch_after(DISPATCH_TIME_NOW + NSEC_PER_SEC * 20, dispatch_get_main_queue()) { () -> Void in
//           
//            self.presentViewController(self.imagePicker, animated: true, completion: nil)
//            
//        }
//        
//        
//    }
    
    
    var pictureTaken = false
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        if pictureTaken == false {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            
            dispatch_after(DISPATCH_TIME_NOW + NSEC_PER_SEC * 20, dispatch_get_main_queue()) { () -> Void in
                
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                
            }
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        println("Camera View Controller 1: \(self.navigationController?.viewControllers)")
        
        let previousVC = self.navigationController?.viewControllers[1] as! ProfileViewController
        
        self.navigationController?.popToViewController(previousVC, animated: true)
    }
    

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        pictureTaken = true
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            saveImageToS3(image)
            
            picker.dismissViewControllerAnimated(true, completion: { () -> Void in
                
                
                let editPictureVC = self.storyboard?.instantiateViewControllerWithIdentifier("editPictureVC") as! EditPictureViewController
                
                editPictureVC.image = image
                
                self.navigationController?.pushViewController(editPictureVC, animated: true)
                
            })
            
        }
        
    }
    
     
   
    
    let s3Manager = AFAmazonS3Manager(accessKeyID: accessKey, secret:secret)
    
    func saveImageToS3(image: UIImage) {
        
       //s3Manager.requestSerializer.bucket = "beaksiebucket"
       // s3Manager.requestSerializer.region = AFAmazonS3USStandardRegion
        
        let timestamp = NSDate().timeIntervalSince1970
        
        let imageName = "myImage_\(timestamp)"
        
        let imageData = UIImagePNGRepresentation(image)
        
     
        
        if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first as? String {
            
            let filePath = documentPath.stringByAppendingPathComponent(imageName + ".png")
            
            imageData.writeToFile(filePath, atomically: false)
            
            let fileURL = NSURL(fileURLWithPath: filePath)
            
          
            
            s3Manager.putObjectWithFile(filePath, destinationPath:imageName + ".png", parameters: nil, progress: { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) -> Void in
                
                let percentageWritten = (CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)) * 100.0
                
                println("Uploaded \(percentageWritten)%")
            
                }, success: { (responseObject) -> Void in
                    
                    let info = responseObject as! AFAmazonS3ResponseObject
                    
                    println("\(info.URL.absoluteString)")
                    
                    RailsRequest.session().imageURL = info.URL.absoluteString
                                    
                }, failure: { (error) -> Void in
                    
                println("\(error)")
            
            
            })
    
    
        }
  
    }
    
}




