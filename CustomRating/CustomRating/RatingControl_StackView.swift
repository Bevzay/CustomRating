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
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
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
    
    //---
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //---
    
    // MARK: Private Methods
    private func setupButtons() {
        
        // Clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        
        // Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "star-rate", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "star-unrate", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "star-highlighted", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount {
            // Create button
            let button = UIButton()
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false    // disables the button's automatically generated constraints
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
        
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl_StackView.ratingButtonTapped(button:)), for: .touchUpInside)
        
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    //---
    
    // MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
            
            // Set the hint string for the currently selected star
            let hintString : String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero"
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString : String
            switch(rating) {
            case 0:
                valueString = "No rating set"
            case 1:
                valueString = "1 star set"
            default:
                valueString = "\(rating) star sets"
            }
            
            // Assign the hint and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
 
        }
    }
    
}
