//
//  BBLeftController.m
//  customPan
//
//  Created by T on 15/7/1.
//  Copyright (c) 2015年 benbun. All rights reserved.
//

#import "BBLeftController.h"
#import "BBTabbarController.h"
#import "BBLeftShowController.h"

@interface BBLeftController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *groupArrays;
@property (nonatomic, weak) UITabBarController *tabVc;
@end
CGFloat const scale = 0.7;
@implementation BBLeftController

- (NSArray *)groupArrays{
    if (!_groupArrays) {
        _groupArrays =@[@[@"金星"], @[@"火星"], @[@"土星"], @[@"木星"], @[@"水星"]];
    }
    return _groupArrays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = BBColor(22, 51, 73, 1.0);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW * scale, kScreenH) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.sectionFooterHeight = 10;
    tableView.sectionHeaderHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    BBTabbarController *tabVc = [[BBTabbarController alloc] init];
    tabVc.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabVc.view];
    [self addChildViewController:tabVc];
    self.tabVc = tabVc;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupArrays.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *rowArray = self.groupArrays[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        UIView *backgroudView = [[UIView alloc] init];
        backgroudView.backgroundColor = BBColor(25, 55, 75, 1.0);
        cell.selectedBackgroundView = backgroudView;
    }
    cell.textLabel.text = self.groupArrays[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BBLeftShowController *show = [[BBLeftShowController alloc] init];
    show.titleName = cell.textLabel.text;
    show.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:show animated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:BBTransformViewNoti object:nil];
}

@end
