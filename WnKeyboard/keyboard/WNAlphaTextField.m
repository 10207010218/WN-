//
//  AlphaTextField.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "WNAlphaTextField.h"
#import "WnAlphaInputView.h"
@interface WNAlphaTextField ()<WnAlphaInputViewDelegate>
@property(nonatomic, strong) WnAlphaInputView * wnInputView;
@end
@implementation WNAlphaTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _passwordStr = @"";
        self.frame = CGRectZero;
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
    
    _wnInputView = [[WnAlphaInputView alloc]init];
    _wnInputView.alphaDelegate =self;
    return _wnInputView;
}

- (void)changeText:(WnAlphaInputView *)inputView numString:(NSString *)numString{
    NSLog(@"%@",numString);
    _passwordStr = numString;
}





@end
