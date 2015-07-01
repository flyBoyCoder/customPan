//
//  BBMeController.m
//  customPan
//
//  Created by T on 15/7/1.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBMeController.h"

@interface BBMeController ()

@end

@implementation BBMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}


@end
