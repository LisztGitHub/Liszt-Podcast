//
//  PCBaseView.m
//  Podcast
//
//  Created by Lester on 16/9/29.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCBaseView.h"

@implementation PCBaseView

-(instancetype)init{
    self = [super init];
    if(self){
        [self addSubview];
        [self addSubviewLayout];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview];
        [self addSubviewLayout];
    }
    return self;
}

-(void)addSubview{
    
}

-(void)addSubviewLayout{
    
}

@end
