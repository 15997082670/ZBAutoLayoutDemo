//
//  ZBAutoLayoutView.m
//  ZBAutoLayoutDemo
//
//  Created by 张斌斌 on 2017/12/20.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "ZBAutoLayoutView.h"
#import "outBox.h"
#import <Masonry.h>
@implementation ZBAutoLayoutView

- (void)preaseData:(NSDictionary *)dict{
    
    //  NSMutableArray *dataSource=[NSMutableArray array];
    self.backgroundColor=[self randomColor];
    NSArray *imageArry=dict[@"images"];
    CGFloat totalHeight=[dict[@"height"] floatValue];
    //在这里我们先将外层的数据处理一下
    NSInteger totalWeight=0;
    for ( NSDictionary *dic in imageArry) {
        totalWeight+=[dic[@"weight"] doubleValue];
    }
    
    NSMutableArray<UIView*> *viewAry=[NSMutableArray arrayWithCapacity:imageArry.count];
    for (NSInteger i=0; i<imageArry.count; i++) {
        
        outBox *box=[[outBox alloc]initWithDic:imageArry[i]];
        UIView *bgview=[[UIView alloc]init];
        bgview.backgroundColor=[self randomColor];
        [self addSubview:bgview];
        [viewAry addObject:bgview];
        
        //竖
        if ([box.orientation isEqualToString:@"h"]) {
            if (i==0) {
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    make.top.equalTo(self.mas_top);
                    make.width.equalTo(self.mas_width);
                    make.left.equalTo(self.mas_left);
                    make.height.mas_equalTo(totalHeight*box.weight/totalWeight);
                    
                }];
            }else{
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(viewAry[i-1].mas_bottom);
                    make.width.equalTo(self.mas_width);
                    make.left.equalTo(self.mas_left);
                    make.height.mas_equalTo(totalHeight*box.weight/totalWeight);
                    
                }];
            }
            
        }else{
            if (i==0) {
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top);
                    make.width.mas_equalTo(self).multipliedBy(box.weight/totalWeight);
                    make.left.equalTo(self.mas_left);
                    make.height.mas_equalTo(totalHeight);
                }];
            }else{
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.mas_top);
                    make.width.mas_equalTo(self).multipliedBy(box.weight/totalWeight);
                    make.left.equalTo(viewAry[i-1].mas_right);
                    make.height.mas_equalTo(totalHeight);
                }];
            }
        }
        
        [self digui:box withParentView:bgview];
    }
    
    
}


- (void)digui:(outBox*)oubox withParentView:(UIView *)parent{
    NSInteger totalWeight=0;
    NSString *orign;
    for ( NSDictionary *dic in oubox.children) {
        totalWeight+=[dic[@"weight"] integerValue];
        if (dic[@"orientation"]) {
            orign=dic[@"orientation"];
        }
    }
    
    
    NSMutableArray<UIView*> *viewAry=[NSMutableArray arrayWithCapacity:oubox.children.count];
    for (NSInteger i=0; i<oubox.children.count; i++) {
        
        outBox *box=[[outBox alloc]initWithDic:oubox.children[i]];
        UIView *bgview=[[UIView alloc]init];
        bgview.backgroundColor=[self randomColor];
        [parent addSubview:bgview];
        [viewAry addObject:bgview];
        
        //竖
        if ([orign isEqualToString:@"h"]) {
            if (i==0) {
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.equalTo(parent);
                    make.width.equalTo(parent.mas_width);
                    make.height.mas_equalTo(parent).multipliedBy(box.weight/totalWeight);
                    
                }];
            }else{
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(viewAry[i-1].mas_bottom);
                    make.width.left.mas_equalTo(parent);
                    make.height.mas_equalTo(parent).multipliedBy(box.weight/totalWeight);
                }];
            }
        }else{
            if (i==0) {
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.height.left.equalTo(parent);
                    make.width.mas_equalTo(parent).multipliedBy(box.weight/totalWeight);
                }];
            }else{
                [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.height.equalTo(parent);
                    make.width.mas_equalTo(parent).multipliedBy(box.weight/totalWeight);
                    make.left.equalTo(viewAry[i-1].mas_right);
                }];
            }
        }
        
        [self digui:box withParentView:bgview];
        
    }
    
    
    
    
}



- (UIColor*) randomColor{
    NSInteger r = arc4random() % 255;
    NSInteger g = arc4random() % 255;
    NSInteger b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

@end
