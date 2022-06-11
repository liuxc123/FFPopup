//
//  BLCustomContentView.swift
//  FFPopup_Swift
//
//  Created by JonyFang on 2019/4/28.
//  Copyright © 2019 JonyFang. All rights reserved.
//

import UIKit

class BLCustomContentView: UIView {
    
    let textField = UITextField()
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    fileprivate func setupViews() {
        backgroundColor = .white
        textField.placeholder = "Please input something"
        self.addSubview(textField)
        self.textField.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
    
}
