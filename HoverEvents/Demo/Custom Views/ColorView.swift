//
//  ColorView.swift
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit

class ColorView: UIView {
	
	// MARK: - Variables
	
	let randomColors: [UIColor] = [.systemPurple, .systemPink, .systemRed, .systemTeal, .systemBlue, .systemGreen, .systemYellow]
	
	// MARK: -

	override func awakeFromNib() {
		super.awakeFromNib()
		self.tracksHoverEvents = true
	}
	
	// MARK: - Overrides
	
	override func cursorHoverChanged(_ pointInView: CGPoint) {
		self.hoveringBackgroundColor = randomColors.randomElement()
	}
	
}
