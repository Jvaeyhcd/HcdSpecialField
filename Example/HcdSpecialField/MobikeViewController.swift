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
    
    lazy var imageView: UIImageView = {
        let width = UIScreen.main.bounds.width - 32
        let height = width * CGFloat(393.0) / CGFloat(999.0)
        let imgView = UIImageView.init(frame: CGRect(x: 16, y: 80, width: UIScreen.main.bounds.width - 32, height: height))
        imgView.image = UIImage.init(named: "scan_pic_input")
        return imgView
    }()
    
    fileprivate lazy var tipsLbl: UILabel = {
        let tipsLbl = UILabel()
        tipsLbl.font = UIFont.systemFont(ofSize: 12)
        tipsLbl.textColor = UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        tipsLbl.textAlignment = .center
        return tipsLbl
    }()
    
    fileprivate lazy var okBtn: UIButton = {
        let okBtn = UIButton()
        okBtn.setTitle("确定", for: UIControlState.normal)
        okBtn.backgroundColor = UIColor.init(red: 0.714, green: 0.714, blue: 0.714, alpha: 1.0)
        okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        okBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        return okBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "Mobike"
        
        let width = UIScreen.main.bounds.width - 32
        let height = width * CGFloat(393.0) / CGFloat(999.0)
        
        self.view.addSubview(self.imageView)
        self.imageView.frame = CGRect(x: 16, y: 80, width: width, height: height)
        
        self.view.addSubview(self.specialField)
        self.specialField.frame = CGRect(x: 16, y: self.imageView.frame.maxY + 16, width: width, height: 50)
        self.specialField.becomeFirstResponder()
        self.specialField.addTarget(self, action: #selector(specialFieldDidChangeValue), for: .valueChanged)
        
        self.tipsLbl.frame = CGRect(x: 0, y: self.specialField.frame.maxY, width: UIScreen.main.bounds.width, height: 40)
        self.tipsLbl.text = "Please check the bike number you entered is correct"
        self.view.addSubview(self.tipsLbl)
        
        self.okBtn.isEnabled = false
        self.okBtn.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 50)
        self.view.addSubview(self.okBtn)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
    }
    
    func specialFieldDidChangeValue() {
        if self.specialField.passcode.characters.count == self.specialField.numberOfDigits {
            self.okBtn.backgroundColor = UIColor.init(red: 0.012, green: 0.663, blue: 0.961, alpha: 1.00)
        } else {
            self.okBtn.backgroundColor = UIColor.init(red: 0.714, green: 0.714, blue: 0.714, alpha: 1.00)
        }
    }
    
    func keyboardDidShow(notification: Notification) {
        print("keyboardDidShow")
        
        let userinfo: NSDictionary = notification.userInfo! as NSDictionary
        
        let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey)
        
        let keyboardRec = (nsValue as AnyObject).cgRectValue
        
        let height = keyboardRec?.size.height
        
        UIView.animate(withDuration: 0.5, animations: {
            self.okBtn.frame.origin.y = UIScreen.main.bounds.height - height! - 50
        }, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
