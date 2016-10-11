//
//  PCTabBarViewController.m
//  Podcast
//
//  Created by Lester on 16/9/27.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCTabBarViewController.h"

@interface PCTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation PCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self viewWillLayoutSubviews];
    [self setupChildControllers];
}

- (void)setupChildControllers
{
    self.delegate = self;
    
    [self setupChildNavigationControllerWithClass:[PCNavigationController class] tabBarImageName:@"tab_home_icon" rootViewControllerClass:[PCHomeViewController class] rootViewControllerTitle:@"点播"];
    [self setupChildNavigationControllerWithClass:[PCNavigationController class] tabBarImageName:@"tab_live_icon" rootViewControllerClass:[PCLiveViewController class] rootViewControllerTitle:@"直播"];
    [self setupChildNavigationControllerWithClass:[PCNavigationController class] tabBarImageName:@"tab_my_icon" rootViewControllerClass:[PCMyViewController class] rootViewControllerTitle:@"我的"];
}

- (void)viewWillLayoutSubviews{
    self.tabBar.tintColor = RandomColor;
    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 53;
    tabFrame.origin.y = self.view.frame.size.height - 53;
    self.tabBar.frame = tabFrame;
    self.tabBar.backgroundColor = [UIColor whiteColor];
    /** 设置默认属性*/
    self.tabBar.barTintColor = [UIColor whiteColor];
    //    self.selectedIndex = 1;
    //    self.selectedViewController = [self.viewControllers objectAtIndex:1];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MAIN_FONT(10.f), NSFontAttributeName,nil] forState:UIControlStateNormal];

    /** 添加阴影*/
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOpacity = 0.5f;
    self.tabBar.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    self.tabBar.layer.shadowRadius = 1.0f;
    /** 去掉黑线*/
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
}

- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title
{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.image = [UIImage imageNamed:name];
    //    navVc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel", name]];
    [self addChildViewController:navVc];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    self.tabBar.tintColor = RandomColor;
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
