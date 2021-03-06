//
//  BCNumPswTextField.m
//  GSWJR
//
//  Created by 汪宁 on 2017/12/22.
//  Copyright © 2017年 zt. All rights reserved.
//

#import "NumPswTextField.h"
#import "WnNumInputView.h"


@interface NumPswTextField ()<WnInputViewDelegate>

@property(nonatomic, strong) WnNumInputView * wnInputView;
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

    _wnInputView = [[WnNumInputView alloc]init];
    _wnInputView.numDelegate =self;
    return _wnInputView;
}

- (void)changeText:(WnNumInputView *)inputView numString:(NSString *)numString{
    NSLog(@"%@",numString);
    _passwordStr = numString;
}





@end
