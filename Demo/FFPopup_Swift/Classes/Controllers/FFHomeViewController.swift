//
//  FFHomeViewController.swift
//  FFPopup_Swift
//
//  Created by JonyFang on 2019/4/28.
//  Copyright © 2019 JonyFang. All rights reserved.
//

import UIKit
import SnapKit

class FFHomeViewController: UIViewController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: Private Methods
    fileprivate func setupViews() {
        view.backgroundColor = .white
        view.addSubview(popButton)
        
        popButton.snp.makeConstraints {
            $0.centerY.equalTo(view.snp_centerY);
            $0.centerX.equalTo(view.snp_centerX);
            $0.width.height.equalTo(200);
        }
    }
    
    @objc fileprivate func showPopup() {
        let popup = FFPopup(contentView: self.alertView, showType: .slideInFromBottom, dismissType: .slideOutToBottom, maskType: .dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        popup.shouldKeyboardChangeFollowed = false
        popup.keyboardOffsetSpacing = 30
        popup.shouldDismissOnPanGesture = true
        popup.panDismissRatio = 0.5
        popup.blurMaskEffectStyle = .light
        popup.dimmedMaskAlpha = 0.8
        popup.show(position: view.center, location: CGPoint(x: 0.5, y: 0.5), inView: view)
    }
    
    // MARK: Properties
    fileprivate lazy var alertView: BLCustomContentView = {
        let w = UIScreen.main.bounds.size.width - 30
        let h = w * 3 / 4
        let frame = CGRect(x: 0, y: 0, width: w, height: h)
        let view = BLCustomContentView(frame: frame)
        view.backgroundColor = .yellow
        return view
    }()
    
    fileprivate lazy var popButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pop", for: .normal)
        button.setTitle("Pop", for: .selected)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white, for: .selected)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 100
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
        return button
    }()

}

