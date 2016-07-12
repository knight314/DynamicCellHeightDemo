//
//  DCConstraintsMasonryViewController.m
//  DynamicCellHeightDemo
//
//  Created by Guangyao on 16/7/4.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "DCConstraintsMasonryViewController.h"
#import "DCConstraintsMasonryCell.h"
@interface DCConstraintsMasonryViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *testTitleArray;
@end

@implementation DCConstraintsMasonryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    self.tableView.frame=self.view.bounds;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableFooterView=UIView.new;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;  //  随便设个不那么离谱的值
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+(NSString *)dcClassDescription{
    
    
    return @"Constraints masonry";
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCConstraintsMasonryCell *cell = [DCConstraintsMasonryCell createWithTitle:self.testTitleArray[indexPath.row] inTableView:tableView];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.testTitleArray.count;
}


- (NSArray *)testTitleArray
{
    return @[@"我是第一个Cell",
             @"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",
             @"我是第三个Cell",
             @"我是第一个Cell",
             @"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell",@"我是第一个Cell",@"我是第二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二二个Cell",@"我是第三个Cell"];
}



@end
