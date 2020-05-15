//
//  UIView+HoverEvents.m
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

#import "UIView+HoverEvents.h"
#import <objc/runtime.h>

///
/// Some good resources:
/// 0: https://developer.apple.com/documentation/objectivec/objective-c_runtime?language=objc
/// 1: https://nshipster.com/associated-objects/
/// 2: this was inspired from: https://gist.github.com/steventroughtonsmith/bbdb02d1a5c118cd66bf68a51cbb00e7
///

@implementation UIView (HoverEvents)

#pragma mark - Associated Objects

- (void)set__hoverEventsGestureRecognizer:(UIHoverGestureRecognizer *)__hoverEventsGestureRecognizer {
	objc_setAssociatedObject(self, @selector(__hoverEventsGestureRecognizer), __hoverEventsGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIHoverGestureRecognizer *)__hoverEventsGestureRecognizer {
	return objc_getAssociatedObject(self, @selector(__hoverEventsGestureRecognizer));
}

- (void)setHoveringBackgroundColor:(UIColor *)hoveringBackgroundColor {
	objc_setAssociatedObject(self, @selector(hoveringBackgroundColor), hoveringBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)hoveringBackgroundColor {
	return objc_getAssociatedObject(self, @selector(hoveringBackgroundColor));
}

- (void)set__backgroundColor:(UIColor *)__backgroundColor {
	objc_setAssociatedObject(self, @selector(__backgroundColor), __backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)__backgroundColor {
	return objc_getAssociatedObject(self, @selector(__backgroundColor));
}

- (void)setTracksHoverEvents:(BOOL)tracksHoverEvents {
	objc_setAssociatedObject(self, @selector(tracksHoverEvents), @(tracksHoverEvents), OBJC_ASSOCIATION_ASSIGN);
	if (tracksHoverEvents) {
		[self _installHighlightHoverGesture];
	} else {
		[self _removeHighlightHoverGesture];
	}
}

- (BOOL)tracksHoverEvents {
	return [objc_getAssociatedObject(self, @selector(tracksHoverEvents)) boolValue];
}

#pragma mark - Override Interface

- (void)cursorHoverBegan:(CGPoint)pointInView { }
- (void)cursorHoverChanged:(CGPoint)pointInView { }
- (void)cursorHoverCancelled:(CGPoint)pointInView { }
- (void)cursorHoverFailed:(CGPoint)pointInView { }
- (void)cursorHoverEnded:(CGPoint)pointInView { }

#pragma mark - Gesture Recognizers

- (void)_installHighlightHoverGesture {
	[self set__backgroundColor:self.backgroundColor];
	self.__hoverEventsGestureRecognizer = [[UIHoverGestureRecognizer alloc] initWithTarget:self action:@selector(handleHoverEventsGestureRecognizer:)];
	[self addGestureRecognizer:self.__hoverEventsGestureRecognizer];
}

- (void)_removeHighlightHoverGesture {
	[self removeGestureRecognizer:self.__hoverEventsGestureRecognizer];
}

- (void)handleHoverEventsGestureRecognizer:(UIHoverGestureRecognizer *)gesture {
	CGPoint pointInView = [gesture locationInView:self];
	
	switch (gesture.state) {
			
		case UIGestureRecognizerStateBegan:
			[self cursorHoverBegan:pointInView];
			if (self.hoveringBackgroundColor != nil)
				[self setBackgroundColor:self.hoveringBackgroundColor];
			break;
			
		case UIGestureRecognizerStateChanged:
			[self cursorHoverChanged:pointInView];
			break;
			
		case UIGestureRecognizerStateEnded:
			[self cursorHoverEnded:pointInView];
			if (self.hoveringBackgroundColor != nil)
				[self setBackgroundColor:self.__backgroundColor];
			break;
			
		case UIGestureRecognizerStateFailed:
			[self cursorHoverFailed:pointInView];
			if (self.hoveringBackgroundColor != nil)
				[self setBackgroundColor:self.__backgroundColor];
			break;
			
		case UIGestureRecognizerStateCancelled:
			[self cursorHoverCancelled:pointInView];
			if (self.hoveringBackgroundColor != nil)
				[self setBackgroundColor:self.__backgroundColor];
			break;
			
		default:
			break;
	}
}

@end
