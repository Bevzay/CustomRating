//
//  RatingControl_StackView.swift
//  CustomRating
//
//  Created by Beverly on 14/05/18.
//  Copyright © 2018 Beverly. All rights reserved.
//

import UIKit

class RatingControl_StackView: UIStackView {

    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Private Methods
    private func setupButtons() {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        // Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false    // disables the button's automatically generated constraints
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Add the button to the stack
        addArrangedSubview(button)
    }
    
}
