//
//  PayView.m
//  FuDianBank
//
//  Created by 汪宁 on 2017/10/23.
//  Copyright © 2017年 WN. All rights reserved.
//

#import "WNPayView.h"
#import "WNDotView.h"
#import "WnNumInputView.h"

@interface WNPayView ()<WnInputViewDelegate>
@property(nonatomic, strong) UIView *topView;
@property(nonatomic, strong) UIView *lineView;
@property(nonatomic, strong) UILabel *desLabel;
@property(nonatomic, strong) UIButton *cancelButton;
@property (strong, nonatomic) NSMutableArray *boxes;
@property (strong, nonatomic)WNDotView *  myTextField;
@property (strong, nonatomic)UITextField *  CVN2TextField;

@property (nonatomic, copy) NSString *passwordStr;

@end

@implementation WNPayView

- (instancetype)init{
    if (self = [super init]) {
       
        self.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _passwordStr = @"";
        [self createTopView];
        
    }
    return self;
}
- (void)show{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }];
}
- (void)createTopView{
    _topView = [[UIView alloc]init];
    _topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_topView];
    
    _desLabel = [[UILabel alloc]init];
    _desLabel.text = @"请输入支付密码";
    _desLabel.textColor = UIColorFromRGB(0x333333);
    _desLabel.textAlignment = NSTextAlignmentCenter;
    [_topView addSubview:_desLabel];
    
    _lineView= [[UIView alloc]init];
    _lineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [_topView addSubview:_lineView];
  
    _cancelButton = [[UIButton alloc]init];
    [_cancelButton setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_cancelButton];
    [self createTextFields];
    [self createKeyboard];

}

- (void)cancel{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
   
}
- (void)createKeyboard{

    WnNumInputView *boardBgView = [[WnNumInputView alloc]init];
    boardBgView.numDelegate = self;
    boardBgView.frame = CGRectMake(0, ScreenHeight*0.32, ScreenWidth, ScreenHeight*0.34);
    boardBgView.backgroundColor = UIColorFromRGB(0xe3e7ee);
    [_topView addSubview:boardBgView];

    
}
- (void)createTextFields{
    CGFloat sideLength = 45;
    CGFloat sideWidth = ScreenWidth -50;
    _myTextField = [[WNDotView alloc]initWithFrame:CGRectMake((ScreenWidth- sideWidth)/2, 90, sideWidth, sideLength)];
    [_topView addSubview:_myTextField];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    _topView.frame = CGRectMake(0, ScreenHeight*0.34, ScreenWidth, ScreenHeight*0.66);
    _desLabel.frame = CGRectMake(0, 0,ScreenWidth, 50);
    _lineView.frame = CGRectMake(0, 50, ScreenWidth, 0.5);
    _cancelButton.frame = CGRectMake(0, 0, 50, 50);
    
}



#pragma mark 数字键盘的代理
- (void)changeText:(WnNumInputView *)inputView numString:(NSString *)numString{
    NSLog(@"%@",numString);
    if (numString.length>6) {
        return;
    }
    
    for (UIView *dotView in _myTextField.dotArray) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < numString.length; i++) {
        ((UIView *)[_myTextField.dotArray objectAtIndex:i]).hidden = NO;
    }
}

@end
