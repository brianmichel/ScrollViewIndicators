//
//  UIScrollView+ScrollIndicators.h
//  ScrollViewIndicators
//
//  Created by Brian Michel on 4/17/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ScrollIndicatorPosition) {
    ScrollIndicatorPositionVertical = 0,
    ScrollIndicatorPositionHorizontal
};

@interface UIScrollView (ScrollIndicators)
- (UIView *)scrollIndicatorForPosition:(ScrollIndicatorPosition)position;
@end
