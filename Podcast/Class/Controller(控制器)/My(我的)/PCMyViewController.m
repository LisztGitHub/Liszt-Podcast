//
//  PCMyViewController.m
//  Podcast
//
//  Created by Lester on 16/9/27.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCMyViewController.h"
#import "PCMyView.h"
#import "PCMyModel.h"

@interface PCMyViewController ()
/** myView*/
@property (strong, nonatomic) PCMyView *myView;
@end

@implementation PCMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.myView.tableView reloadData];
}
-(void)addSubViewAndCreateLayout{
    self.title = @"我的";
    /** 1.添加视图*/
    [self.view addSubview:self.myView];
    
    /** 2.创建约束*/
    self.myView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topEqualToView(self.view).bottomEqualToView(self.view);
}
#pragma mark - 懒加载
- (PCMyView *)myView{
    if(!_myView){
        _myView  = [PCMyView new];
        [_myView setMainDataSource:self.datas];
    }
    return _myView;
}
- (NSArray *)datas{
    NSMutableArray *tempData = [NSMutableArray arrayWithCapacity:0];
    
    PCMyModel *tempModel1 = [[PCMyModel alloc]init];
    tempModel1.title = @"邀请好友";
    tempModel1.iconName = @"my_list_share";
    
    PCMyModel *tempModel2 = [[PCMyModel alloc]init];
    tempModel2.title = @"设置";
    tempModel2.iconName = @"my_list_setting";
    
    PCMyModel *tempModel3 = [[PCMyModel alloc]init];
    tempModel3.title = @"关注";
    tempModel3.iconName = @"my_list_follow";
    
    PCMyModel *tempModel4 = [[PCMyModel alloc]init];
    tempModel4.title = @"充值";
    tempModel4.iconName = @"my_list_recharge";
    
    PCMyModel *tempModel5 = [[PCMyModel alloc]init];
    tempModel5.title = @"历史记录";
    tempModel5.iconName = @"my_list_history";
    
    [tempData addObject:@[tempModel1]];
    [tempData addObject:@[tempModel5,tempModel4,tempModel3]];
    [tempData addObject:@[tempModel2]];
    return tempData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
