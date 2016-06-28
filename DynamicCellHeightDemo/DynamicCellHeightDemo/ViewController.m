//
//  ViewController.m
//  DynamicCellHeightDemo
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,copy) NSArray *testTitleArray;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.frame=self.view.bounds;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableFooterView=UIView.new;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [TestCell createWithTitle:self.testTitleArray[indexPath.row] inTableView:tableView];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  *注意：计算Cell高度的过程，一定不要放在此代理方法中！这一点在后文中将会有所提及，此处仅为演示方便
    
   TestCell *cell = [TestCell createWithTitle:self.testTitleArray[indexPath.row] inTableView:tableView];
    CGFloat cellHeight = [cell cellHeight];
    NSLog(@"%f",cellHeight);
    return cellHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testTitleArray.count;
}
#pragma mark - Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}


- (NSArray *)testTitleArray
{
    return @[@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell",@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell",@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell"];
}




@end
