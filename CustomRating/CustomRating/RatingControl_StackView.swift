//
//  RatingControl_StackView.swift
//  CustomRating
//
//  Created by Beverly on 14/05/18.
//  Copyright © 2018 Beverly. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl_StackView: UIStackView {
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize = CGSize(width: 50.0, height: 50.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
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
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        for _ in 0..<starCount {
            // Create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
        
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false    // disables the button's automatically generated constraints
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
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
