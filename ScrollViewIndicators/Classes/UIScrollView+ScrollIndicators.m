//
//  UIScrollView+ScrollIndicators.m
//  ScrollViewIndicators
//
//  Created by Brian Michel on 4/17/13.
//  Copyright (c) 2013 Brian Michel. All rights reserved.
//

#import "UIScrollView+ScrollIndicators.h"
#import <objc/runtime.h>

@implementation UIScrollView (ScrollIndicators)
- (UIView *)scrollIndicatorForPosition:(ScrollIndicatorPosition)position {
    UIEdgeInsets restorableInsets = self.contentInset;
    self.contentInset = UIEdgeInsetsMake(1, 1, 1, 1);
    
    UIView *viewToReturn = nil;
    NSString *indicatorIvarString = nil;
    switch (position) {
        case ScrollIndicatorPositionHorizontal:
            indicatorIvarString = @"_horizontalScrollIndicator";
            break;
        case ScrollIndicatorPositionVertical:
            indicatorIvarString = @"_verticalScrollIndicator";
            break;
        default:
            break;
    }
    if (indicatorIvarString) {
        Ivar indicator = class_getInstanceVariable([self class], [indicatorIvarString cStringUsingEncoding:NSUTF8StringEncoding]);
        if (indicator) {
            id iVarValue = object_getIvar(self, indicator);
            if ([iVarValue isKindOfClass:[UIView class]]) {
                viewToReturn = (UIView *)iVarValue;
            }
        }
    }
    self.contentInset = restorableInsets;
    return viewToReturn;
}
@end
