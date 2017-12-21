//
//  outBox.h
//  ZBAutoLayoutDemo
//
//  Created by 张斌斌 on 2017/12/18.
//  Copyright © 2017年 张斌. All rights reserved.
//

#import "BaseBox.h"

@interface outBox : BaseBox

@property(strong,nonatomic)NSArray *children;
@property(copy,nonatomic)NSString  *orientation;
@property(assign,nonatomic)double  weight;
@property(copy,nonatomic)NSString  *image;
@end
