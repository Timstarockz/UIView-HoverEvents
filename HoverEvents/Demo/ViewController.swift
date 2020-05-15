//
//  ViewController.swift
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Variables
	
	@IBOutlet var colorView: ColorView!
	@IBOutlet var trackView: TrackingView!
	
	// MARK: - View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// customize color view a bit
		colorView.layer.masksToBounds = true
		colorView.layer.cornerRadius = 10
		
		// customize tracking view a bit
		trackView.layer.masksToBounds = true
		trackView.layer.cornerRadius = 10
	}

}

