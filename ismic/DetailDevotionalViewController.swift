//
//  DetailDevotionalViewController.swift
//  ismic
//
//  Created by Muluken on 6/18/17.
//  Copyright © 2017 GCME-EECMY. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase
import FirebaseStorage

class DetailDevotionalViewController: UIViewController {
    
    var dataBaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    
    var storageRef: FIRStorage {
        
        return FIRStorage.storage()
    }
    
    @IBOutlet weak var detailtitle: UILabel!
    
    
    @IBOutlet weak var imagedetail: UIImageView!
    
    @IBOutlet weak var detaildesc: UITextView!
    
    
    
    
    var SentData1:String!
    var SentData2:String!
    var SentData3:String!
    var SentData4:String!
    var SentData5:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let nav = self.navigationController?.navigationBar
        //        nav?.barStyle = UIBarStyle.black
        //        nav?.tintColor = UIColor.white
        //        nav?.backgroundColor = UIColor(red: 38.0/255.0, green: 64.0/255.0, blue: 103.0/255.0, alpha: 1.0)
        //        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
        configureCell()
        
    }
    func configureCell(){
        
        self.detailtitle.text = SentData1
        self.detaildesc.text = SentData4
        
                let devotionalImageUrl = SentData3
        
                self.storageRef.reference(forURL: devotionalImageUrl!).data(withMaxSize: 15 * 1024 * 1024, completion: { (imgData, error) in
        
                    if error == nil {
                        DispatchQueue.main.async {
                            if let data = imgData {
                                self.imagedetail.image = UIImage(data: data)
                            }
                        }
        
                    }else {
                        print(error!.localizedDescription)
        
                    }
        
        
                })
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}