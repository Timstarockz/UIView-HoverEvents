//
//  UIView+HoverEvents.h
//  HoverEvents
//
//  Created by Tim Desir on 5/14/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HoverEvents)

/// set `true` to enable the hover recognizer. `false` to remove it
@property BOOL tracksHoverEvents;

/// support for changing the background color while hovering
@property UIColor *hoveringBackgroundColor;

/// some methods to override in your subclass
- (void)cursorHoverBegan:(CGPoint)pointInView;
- (void)cursorHoverChanged:(CGPoint)pointInView;
- (void)cursorHoverCancelled:(CGPoint)pointInView;
- (void)cursorHoverFailed:(CGPoint)pointInView;
- (void)cursorHoverEnded:(CGPoint)pointInView;

/// used to store a backup of the views background color
@property UIColor *__backgroundColor;

/// internal gesture recognizer
@property UIHoverGestureRecognizer *__hoverEventsGestureRecognizer;

@end
