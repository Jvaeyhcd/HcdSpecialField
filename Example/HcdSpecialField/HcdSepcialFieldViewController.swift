//
//  HcdSepcialFieldViewController.swift
//  HcdSpecialField
//
//  Created by Jvaeyhcd on 11/05/2017.
//  Copyright © 2017 Jvaeyhcd. All rights reserved.
//

import UIKit
import HcdSpecialField

class HcdSepcialFieldViewController: UIViewController {

    @IBOutlet weak var specialField: HcdSpecialField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
