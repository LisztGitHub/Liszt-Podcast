//
//  PCTabBarView.h
//  Podcast
//
//  Created by Lester on 16/10/8.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCBaseView.h"

@class PCTabBarView;

@protocol PCTabBarViewDelegate <NSObject>
@optional
/** 返回点击tab的下标*/
- (void)tabBar:(PCTabBarView *)tabBar selectedIndex:(NSInteger)index;

@end

@interface PCTabBarView : PCBaseView
@property (assign, nonatomic) id<PCTabBarViewDelegate>delegate;
@end
