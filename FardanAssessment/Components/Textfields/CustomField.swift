//
//  CustomField.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 10/03/23.
//

import UIKit

class CustomField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
    
    let borderColor = UIColor(named: "RectircleTextfieldBorderColor")
    let backgroundcolor = UIColor(named: "RectircleTextfieldBackgroundColor")
    let textcolor = UIColor(named: "RectircleTextfieldTextColor")
    let errorColor = UIColor(named: "RectircleTextfieldErrorColor")
        
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        customizeView()
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}

private extension CustomField {
    
    func customizeView() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.primaryColor?.cgColor
        layer.cornerRadius = 15.0
        clipsToBounds = true
        font = UIFont.systemFont(ofSize: 14)

        if !isSecureTextEntry {
            textColor = .textColor
        }
        
        tintColor = .textColor
    }
}
