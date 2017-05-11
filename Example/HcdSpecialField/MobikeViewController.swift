//
//  HcdSpecialViewController.swift
//  HcdSpecialField
//
//  Created by Jvaeyhcd on 10/05/2017.
//  Copyright © 2017 Jvaeyhcd. All rights reserved.
//

import UIKit
import HcdSpecialField

class MobikeViewController: UIViewController {
    
    lazy var specialField: HcdSpecialField = {
        let specialField = HcdSpecialField.init(frame: CGRect(x: 16, y: 80, width: UIScreen.main.bounds.width - 32, height: 40))
        specialField.spaceBetweenDigits = 4
        specialField.numberOfDigits = 11
        specialField.textColor = UIColor.white
        specialField.backColor = UIColor.init(red: 0.867, green: 0.867, blue: 0.867, alpha: 1.0)
        specialField.dashBackColor = UIColor.init(red: 0.933, green: 0.933, blue: 0.933, alpha: 1.0)
        return specialField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "Mobike"
        
        self.view.addSubview(self.specialField)
        self.specialField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
