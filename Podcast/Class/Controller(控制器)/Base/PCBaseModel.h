//
//  PCBaseModel.h
//  Podcast
//
//  Created by Lester on 16/9/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCBaseModel : NSObject
+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
