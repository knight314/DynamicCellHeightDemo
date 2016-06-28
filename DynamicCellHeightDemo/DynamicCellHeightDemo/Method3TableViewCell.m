//
//  Method3TableViewCell.m
//  DynamicCellHeightDemo
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "Method3TableViewCell.h"

@interface Method3TableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *longLabel;


@property (weak, nonatomic) IBOutlet UIView *bottomCub;


@end

@implementation Method3TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+(instancetype)createWithTitle:(NSString *)title inTableView:(UITableView *)tableView{
    Method3TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions].lastObject;
    }
    cell.longLabel.text=title;
    return cell;
    
}


@end
