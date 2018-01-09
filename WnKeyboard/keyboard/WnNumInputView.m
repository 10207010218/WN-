//
//  WnInputView.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "WnNumInputView.h"

@interface WnNumInputView ()
@property(nonatomic, copy)NSString * passwordStr;
@end

@implementation WnNumInputView

- (instancetype)init{
    if (self = [super init]) {
        _passwordStr = @"";
        self.frame = CGRectMake(0, ScreenHeight*0.34, ScreenWidth, ScreenHeight*0.34);
       self.backgroundColor = [UIColor colorWithRed:0.82f green:0.83f blue:0.87f alpha:1.00f];
        CGFloat space = 6;
        CGFloat width = (ScreenWidth- space*4)/3;
        CGFloat height = (ScreenHeight*0.34-space*5)/4;
        for (int i= 0; i<12; ++i) {
            
            NSInteger m = i%3;
            NSInteger n = i/3;
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(space+(width+space)*m, space+(space+height)*n, width, height)];
            button.backgroundColor = [UIColor whiteColor];
            [button addTarget:self action:@selector(clickPswNum:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = BeginTag+i;
            button.layer.masksToBounds =YES;
            button.layer.cornerRadius = 5;
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
            button.adjustsImageWhenHighlighted = NO;
            [self addSubview:button];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:18];
            if (i<9) {
                [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
                
            }
            
            if (i==10) {
                [button setTitle:@"0" forState:UIControlStateNormal];
            }
            
            if (i==11) {
                button.backgroundColor = [UIColor clearColor];
                [button setImage:[UIImage imageNamed:@"deleIma"] forState:UIControlStateNormal];
            }
            if (i==9) {
                button.hidden = YES;
            }
            
        }
    }
    return self;
}





- (void)clickPswNum:(UIButton *)button{
    NSInteger num = button.tag-BeginTag;
    
    if (num== 9) {
        return;
    }
    if (num == 10) {
        num =9;
    }
    // 删除
    if (num == 11) {
        if (_passwordStr.length>0) {
            _passwordStr = [_passwordStr substringToIndex:_passwordStr.length-1];

            [self.numDelegate changeText:self numString:_passwordStr];
        }
        
        return;
    }
    
    _passwordStr =   [_passwordStr stringByAppendingString:[NSString stringWithFormat:@"%ld",(num+1)%10]];
    
    [self.numDelegate changeText:self numString:_passwordStr];
   
    
}




@end
