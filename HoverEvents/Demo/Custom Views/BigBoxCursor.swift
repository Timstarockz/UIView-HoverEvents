//
//  BigBoxCursor.swift
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit

class BigBoxCursor: UIView {
	
	// MARK: - Variables & Initialization
	
	private(set) var label: UILabel!
	
	// --
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .clear
		
		// setup label
		label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		NSLayoutConstraint.activate ([
			label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
			label.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Draw

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
        // Drawing code
		context.setFillColor(UIColor.clear.cgColor)
		context.setStrokeColor(UIColor.systemYellow.cgColor)
		context.setLineWidth(10)

		let rectangle = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
		context.addRect(rectangle)
		context.drawPath(using: .fillStroke)
    }

}
