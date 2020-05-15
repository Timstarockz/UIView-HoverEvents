//
//  TrackingView.swift
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit

class TrackingView: UIView {
	
	// MARK: - Variables
	
	var cursor: BigBoxCursor!
	
	// MARK: -

    override func awakeFromNib() {
		super.awakeFromNib()
		self.tracksHoverEvents = true
		
		// init cursor
		cursor = BigBoxCursor(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		cursor.alpha = 0.0
		self.addSubview(cursor)
	}
	
	// MARK: - Private Interface
	
	private func showCursor(_ flag: Bool, animated: Bool) {
		UIView.animate(withDuration: animated ? 0.125 : 0.0) {
			self.cursor.alpha = flag ? 1.0 : 0.0
		}
	}
	
	// MARK: - Hover Event Overrides
	
	override func cursorHoverBegan(_ pointInView: CGPoint) {
		self.showCursor(true, animated: true)
	}
	
	override func cursorHoverChanged(_ pointInView: CGPoint) {
		self.cursor.center = pointInView
		self.cursor.label.text = "(x: \(Int(pointInView.x)), y: \(Int(pointInView.y)))"
	}
	
	override func cursorHoverEnded(_ pointInView: CGPoint) {
		self.showCursor(false, animated: true)
	}
	
	override func cursorHoverCancelled(_ pointInView: CGPoint) {
		self.showCursor(false, animated: true)
	}
	
	override func cursorHoverFailed(_ pointInView: CGPoint) {
		self.showCursor(false, animated: true)
	}

}
