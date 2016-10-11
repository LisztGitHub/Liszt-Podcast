//
//  PCBaseModel.m
//  Podcast
//
//  Created by Lester on 16/9/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCBaseModel.h"

@implementation PCBaseModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    PCBaseModel *model = [[PCBaseModel alloc] init];
    return model;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
