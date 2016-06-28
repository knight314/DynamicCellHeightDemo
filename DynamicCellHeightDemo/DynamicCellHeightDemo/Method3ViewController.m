//
//  Method3ViewController.m
//  DynamicCellHeightDemo
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "Method3ViewController.h"
#import "Method3TableViewCell.h"


@interface Method3ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *testTitleArray;

@end

@implementation Method3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame=self.view.bounds;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableFooterView=UIView.new;
    
    self.tableView.estimatedRowHeight = 100;  //  随便设个不那么离谱的值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Method3TableViewCell *cell = [Method3TableViewCell createWithTitle:self.testTitleArray[indexPath.row] inTableView:tableView];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testTitleArray.count;
}


- (NSArray *)testTitleArray
{
    return @[@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell",@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell",@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell"];
}


@end
