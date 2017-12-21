//
//  BaseBox.m
//  DaGuanJia
//
//  Created by 张斌斌 on 16/10/18.
//  Copyright © 2016年 ck. All rights reserved.
//

#import "BaseBox.h"

@implementation BaseBox
- (id)initWithDic:(NSDictionary *)info
{
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:info];
    }
    
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    return;
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//    
//    if ([value isKindOfClass:[NSNull class]]) {
//        [super setValue:@"" forKey:key];
//    }
//}
@end
