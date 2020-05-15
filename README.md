# 🍃 UIView (HoverEvents)

Super easy hover gesture support for UIView (and UIView subclasses!)

# Compatability:

* iPadOS 13.0+
* Mac Catalyst 13.0+

# Usage:

### Enable hover events by simply setting a BOOL on your UIView subclass!

Swift (from [**ColorView.swift**](https://github.com/Timstarockz/UIView-HoverEvents/blob/master/HoverEvents/Demo/Custom%20Views/ColorView.swift)):

```swift
override func awakeFromNib() {
		super.awakeFromNib()
		
		// just one line of code!
		self.tracksHoverEvents = true
}
```

Objective-C:

```objective-c
- (void)awakeFromNib {
	[super awakeFromNib];
	
	// still just one line of code!
	[self setTracksHoverEvents:YES];
}
```

### You can also easily track the cursors position IN the view!

Swift (from [**TrackingView.swift**](https://github.com/Timstarockz/UIView-HoverEvents/blob/master/HoverEvents/Demo/Custom%20Views/TrackingView.swift)):

```swift
override func cursorHoverBegan(_ pointInView: CGPoint) {
	// ...
}
	
override func cursorHoverChanged(_ pointInView: CGPoint) {
	// ...
}
	
override func cursorHoverEnded(_ pointInView: CGPoint) {
	// ...
}

override func cursorHoverCancelled(_ pointInView: CGPoint) {
	// ...
}

override func cursorHoverFailed(_ pointInView: CGPoint) {
	// ...
}
```

### There's also simple support for highlighting a view when it's being hovered:

Swift:

```swift
self.hoveringBackgroundColor = UIColor.systemTeal
```

Objective-C:

```objective-c
[self setHoveringBackgroundColor:[UIColor systemTealColor]];
```

### Don't forget to import the header file in your [Bridging Header](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift) if you're using Swift!

(from [HoverEvents-Bridging-Header.h](https://github.com/Timstarockz/UIView-HoverEvents/blob/master/HoverEvents/HoverEvents-Bridging-Header.h)):

```objective-c
//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import "UIView+HoverEvents.h"
```

# Demo:

The demo app is built with Storyboards and the custom views are setup in [**ViewController.swift**](https://github.com/Timstarockz/UIView-HoverEvents/blob/master/HoverEvents/Demo/ViewController.swift)

### Build, run, have fun!