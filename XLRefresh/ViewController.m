//
//  ViewController.m
//  XLRefresh
//
//  Created by 邓西亮 on 16/10/21.
//  Copyright © 2016年 dxl. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+XLRefresh.h"
#import "XLRefreshHeader.h"

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define view_scal (ScreenWidth/1242)


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *testTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"refresh";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.testTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight)];
    self.testTableView.delegate = self;
    self.testTableView.dataSource = self;
    self.testTableView.backgroundColor = [UIColor orangeColor];
    [self.testTableView addRefreshHeaderWithHandle:^(){
        NSLog(@"开始刷新");
    }];
    [self.view addSubview:self.testTableView];

}

#pragma mark - UItableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400*view_scal;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
        
    }
    cell.textLabel.font = [UIFont systemFontOfSize:50*view_scal];
    cell.textLabel.text = @"test";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.testTableView.header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
