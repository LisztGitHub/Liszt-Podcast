//
//  PCTabBarView.m
//  Podcast
//
//  Created by Lester on 16/10/8.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCTabBarView.h"

@interface PCTabBarView(){
    /** 所有tabBarButtons*/
    NSMutableArray *tabBarItems;
}

@end

@implementation PCTabBarView

-(void)addSubview{
    self.backgroundColor = [UIColor whiteColor];
    tabBarItems = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *titles = @[@"点播",@"直播",@"我的"];
    NSArray *imageName = @[@"tab_home_icon",@"tab_live_icon",@"tab_my_icon"];
    for(NSInteger i = 0; i < 3;i++){
        if(i==1){
            UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
            centerButton.frame = CGRectMake(i*SCREEN_WIDTH/3, -19, SCREEN_WIDTH/3, self.height);
            centerButton.titleLabel.font = MAIN_FONT(12);
            centerButton.tag=i;
            [centerButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [centerButton setImage:[[UIImage imageNamed:imageName[i]] tintedImageWithColor:RGBA(72, 165, 250, 1)] forState:UIControlStateNormal];
            [centerButton setImage:[[UIImage imageNamed:imageName[i]] tintedImageWithColor:RGBA(72, 165, 250, 1)] forState:UIControlStateHighlighted];
            [centerButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleImageTop imageTitlespace:0];
             [self addSubview:centerButton];
            [tabBarItems addObject:centerButton];
            continue;
        }
        UIButton *tabBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarButton.frame = CGRectMake(i*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, self.height);
        [tabBarButton setTitle:titles[i] forState:UIControlStateNormal];
        tabBarButton.titleLabel.font = MAIN_FONT(12);
        tabBarButton.selected=!i;
        tabBarButton.tag=i;
        [tabBarButton setImage:[[UIImage imageNamed:imageName[i]] tintedImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateNormal];
        [tabBarButton setImage:[[UIImage imageNamed:imageName[i]] tintedImageWithColor:Main_TintColor] forState:UIControlStateHighlighted];
        [tabBarButton setImage:[[UIImage imageNamed:imageName[i]] tintedImageWithColor:Main_TintColor] forState:UIControlStateSelected];
        [tabBarButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [tabBarButton setTitleColor:Main_TintColor forState:UIControlStateHighlighted];
        [tabBarButton setTitleColor:Main_TintColor forState:UIControlStateSelected];
        [tabBarButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [tabBarButton layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleImageTop imageTitlespace:3];
        [self addSubview:tabBarButton];
        [tabBarItems addObject:tabBarButton];
    }
    
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOpacity = 0.7f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.layer.shadowRadius = 2.0f;
}

#pragma mark - Button Action
- (void)buttonAction:(UIButton *)button{
    if([self.delegate respondsToSelector:@selector(tabBar:selectedIndex:)]){
        [self.delegate tabBar:self selectedIndex:button.tag];
    }
    
//    if(button.tag==1){
//        return;
//    }
    for(UIButton *btn in tabBarItems){
        btn.selected = btn.tag==button.tag;
    }
}

@end
