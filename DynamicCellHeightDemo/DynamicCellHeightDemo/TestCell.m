//
//  TestCell.m
//  DynamicCellHeightDemo
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "TestCell.h"
@interface TestCell()

@property (weak, nonatomic) IBOutlet UILabel *longLabel;

@property (weak, nonatomic) IBOutlet UIView *bottomCub;

@end

@implementation TestCell

#pragma mark - cell life cycle

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)createWithTitle:(NSString *)title inTableView:(UITableView *)tableView{
    TestCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:kNilOptions].lastObject;
    }
    cell.longLabel.text=title;
    return cell;

}

-(CGFloat)cellHeight{
    CGRect rect=self.frame;
    rect.size.width=[[UIScreen mainScreen]bounds].size.width;
    self.frame=rect;
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.bottomCub.frame);


}

@end
