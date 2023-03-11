//
//  PrimaryButton.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import UIKit

class PrimaryButton: UIButton {
        
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = .primaryColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 15.0
        clipsToBounds = true
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
}
