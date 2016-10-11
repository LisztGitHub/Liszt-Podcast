//
//  PCMyView.m
//  Podcast
//
//  Created by Lester on 16/9/30.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCMyView.h"
#import "PCMyHeadView.h"
#import "PCMyModel.h"
#import "PCLoginViewController.h"

@interface PCMyView()<UITableViewDelegate,UITableViewDataSource>{
    /**  数据*/
    NSArray *dataList;
}
/** headView*/
@property (strong, nonatomic) PCMyHeadView *headView;

@end

@implementation PCMyView

-(void)addSubview{
    [self addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headView;
}
-(void)addSubviewLayout{
    self.tableView.sd_layout.leftEqualToView(self).rightEqualToView(self).topEqualToView(self).bottomEqualToView(self);
}

-(void)setMainDataSource:(NSArray *)datas{
    dataList = datas;
    [self.tableView reloadData];
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0;
        _tableView.contentInset = UIEdgeInsetsMake(-80, 0, 0, 0);
    }
    return _tableView;
}
- (PCMyHeadView *)headView{
    if(!_headView){
        _headView = [[PCMyHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ADAPTER_WIDTH * 270)];
    }
    return _headView;
}

#pragma mark - tableView DataSoruce and Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataList.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[dataList objectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Lester_lz@163.com";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    [self configureTableViewCell:cell indexPath:indexPath];
    return cell;
}
- (void)configureTableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    PCMyModel *tempMyModel = dataList[indexPath.section][indexPath.row];
    cell.textLabel.text = tempMyModel.title;
    cell.textLabel.font = MAIN_FONT(15);
    cell.imageView.image = [[UIImage imageNamed:tempMyModel.iconName] tintedImageWithColor:RandomColor];
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return section==0?0:20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.findViewController.navigationController pushViewController:[[PCLoginViewController alloc] init] animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ADAPTER_WIDTH * 45;
}

@end
