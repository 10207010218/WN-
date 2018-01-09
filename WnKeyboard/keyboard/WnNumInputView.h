//
//  WnInputView.h
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BeginTag 10385

@protocol WnInputViewDelegate;

@interface WnNumInputView : UIView

@property(nonatomic, strong)id <WnInputViewDelegate>numDelegate;

@end

@protocol WnInputViewDelegate <NSObject>
- (void)changeText:(WnNumInputView *)inputView numString:(NSString *)numString;
@end
