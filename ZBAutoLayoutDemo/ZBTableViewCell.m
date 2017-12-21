//
//  ZBTableViewCell.m
//  ZBAutoLayoutDemo
//
//  Created by 张斌斌 on 2017/12/20.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ZBTableViewCell.h"
#import "ZBAutoLayoutView.h"
#import <Masonry.h>
@interface ZBTableViewCell()
@property(strong,nonatomic)ZBAutoLayoutView *layoutView;
@end
@implementation ZBTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)creteViewForDictionary:(NSDictionary*)dict{
    
    [_layoutView removeFromSuperview];
    _layoutView =[[ZBAutoLayoutView alloc]init];
    [_layoutView preaseData:dict];
    [self addSubview:_layoutView];
    [_layoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat height=[dict[@"height"] floatValue];
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(height);
    }];
}
@end
