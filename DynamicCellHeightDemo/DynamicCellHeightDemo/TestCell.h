//
//  TestCell.h
//  DynamicCellHeightDemo
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

+(instancetype)createWithTitle:(NSString *)title inTableView:(UITableView *)tableView;


-(CGFloat)cellHeight;
@end
