//
//  HcdSpecialLabel.swift
//  govlan
//
//  Created by Jvaeyhcd on 23/05/2017.
//  Copyright © 2017 Jvaeyhcd. All rights reserved.
//

import UIKit

class HcdSpecialLabel: UIView {
    

    lazy var label: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.label.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.label.textAlignment = .center
        self.addSubview(self.label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
