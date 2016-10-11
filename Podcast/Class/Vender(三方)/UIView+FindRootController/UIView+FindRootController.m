//
//  UIView+FindRootController.m
//  CarSteward
//
//  Created by LiuLei on 15/10/24.
//  Copyright © 2015年 LiuLei. All rights reserved.
//

#import "UIView+FindRootController.h"

@implementation UIView (FindRootController)

- (UIViewController*)findViewController
{
    UIResponder* responder = self.nextResponder;
    
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            
            return (UIViewController*)responder;
        }
        responder = responder.nextResponder;
        
    } while (responder != nil);
    
    return  nil;
}
@end
