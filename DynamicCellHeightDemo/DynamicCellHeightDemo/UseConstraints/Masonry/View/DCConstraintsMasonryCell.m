//
//  DCConstraintsMasonryCell.m
//  DynamicCellHeightDemo
//
//  Created by Guangyao on 16/7/4.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "DCConstraintsMasonryCell.h"

@interface DCConstraintsMasonryCell ()

@property (strong, nonatomic)   UILabel *longLabel;


@property (strong, nonatomic)  UIView *bottomCub;


@end

@implementation DCConstraintsMasonryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UILabel *)longLabel{
    if (!_longLabel) {
        _longLabel=[[UILabel alloc]init];
        _longLabel.numberOfLines=0;
        _longLabel.backgroundColor=[UIColor blueColor];
        [self.contentView addSubview:_longLabel];
    }
    return _longLabel;

}

-(UIView *)bottomCub{
    if (!_bottomCub) {
        _bottomCub=[[UIView alloc]init];
        _bottomCub.backgroundColor=[UIColor orangeColor];
        [self.contentView addSubview:_bottomCub];
    }
    return _bottomCub;

}

+(instancetype)createWithTitle:(NSString *)title inTableView:(UITableView *)tableView{
    DCConstraintsMasonryCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell=[[DCConstraintsMasonryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
     
        
    }
    cell.longLabel.text=title;
    return cell;


}

-(void)updateConstraints{
    [self.longLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.bottomCub.mas_top).offset(0);
    }];
    
    [self.bottomCub mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.equalTo(@40);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@100);
    }];
    
    
    [super updateConstraints];


}

@end
