//
//  BCNumPswTextField.m
//  GSWJR
//
//  Created by 汪宁 on 2017/12/22.
//  Copyright © 2017年 zt. All rights reserved.
//

#import "NumPswTextField.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BeginTag 10385

@interface NumPswTextField ()

@property(nonatomic, strong) UIView * wnInputView;
@end

@implementation NumPswTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _passwordStr = @"";
        self.inputView = [self createInputView];
        self.inputAccessoryView = [self accessoryView];
    }
    
    return self;
}

- (UIView *)accessoryView{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    view.backgroundColor = UIColorFromRGB(0xf7f8f9);
    UIView *lineView= [[UIView alloc]initWithFrame:CGRectMake(0, 44.5, ScreenWidth, 0.5)];
    lineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [view addSubview:lineView];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 45)];
    [button setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    return view;
}
- (void)cancel{
    [self resignFirstResponder];
}
- (UIView *)createInputView{

 _wnInputView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight*0.34, ScreenWidth, ScreenHeight*0.34)];
 _wnInputView.backgroundColor = [UIColor colorWithRed:0.82f green:0.83f blue:0.87f alpha:1.00f];
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
    [_wnInputView addSubview:button];
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
    return _wnInputView;
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
            self.text = _passwordStr;
            [self.numDelegate changeText:self];
        }
        
        return;
    }
    
    _passwordStr =   [_passwordStr stringByAppendingString:[NSString stringWithFormat:@"%ld",(num+1)%10]];
     self.text = _passwordStr;
     [self.numDelegate changeText:self];
    // 输入
    if (_passwordStr.length>=6) {
        // 验证密码
        _passwordStr = [_passwordStr substringToIndex:6];
        self.text = _passwordStr;
         [self.numDelegate changeText:self];

    }
    
}




@end
