//
//  BBTabbarController.m
//  customPan
//
//  Created by T on 15/7/1.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBTabbarController.h"
#import "BBMeController.h"
#import "BBSceneController.h"
#import "BBWhearController.h"

@interface BBTabbarController ()

@end

@implementation BBTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [self.tabBar setBarTintColor:[UIColor clearColor]];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        BBWhearController *whear = [[BBWhearController alloc] init];
        [self addSubVc:whear title:@"天气" image:@"tabbar_weather_normal" selImage:@"tabbar_weather_select"];
        BBSceneController *scene = [[BBSceneController alloc] init];
        [self addSubVc:scene title:@"场景" image:@"tabbar_live_normal" selImage:@"tabbar_live_select"];
        BBMeController *me = [[BBMeController alloc] init];
        [self addSubVc:me title:@"我" image:@"tabbar_profile_normal" selImage:@"tabbar_profile_select"];
     }
    return self;
}

- (void)addSubVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage{
    
    vc.tabBarItem.title = title;
    [vc.tabBarItem setImage:[UIImage imageNamed:image]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selImage]];
//    [self.tab addItemTitle:title image:image selImage:selImage];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

@end
