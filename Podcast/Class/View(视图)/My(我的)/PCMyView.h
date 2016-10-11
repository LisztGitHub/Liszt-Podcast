//
//  PCMyView.h
//  Podcast
//
//  Created by Lester on 16/9/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCBaseView.h"

@interface PCMyView : PCBaseView
/** 设置Data*/
- (void)setMainDataSource:(NSArray *)datas;
/** tableView*/
@property (strong, nonatomic) UITableView *tableView;
@end
