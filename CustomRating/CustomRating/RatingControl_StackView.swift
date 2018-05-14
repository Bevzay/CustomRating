//
//  RatingControl_StackView.swift
//  CustomRating
//
//  Created by Beverly on 14/05/18.
//  Copyright © 2018 Beverly. All rights reserved.
//

import UIKit

class RatingControl_StackView: UIStackView {
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    
    
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
        
        for _ in 0..<5 {
            // Create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
        
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false    // disables the button's automatically generated constraints
            button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl_StackView.ratingButtonTapped(button:)), for: .touchUpInside)
        
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button Pressed")
    }
    
}
