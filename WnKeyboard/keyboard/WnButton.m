//
//  WnButton.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "WnButton.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation WnButton

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.8;
        self.layer.borderColor = UIColorFromRGB(0x999999).CGColor;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}

@end
