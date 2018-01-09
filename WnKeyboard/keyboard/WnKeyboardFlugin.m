//
//  WnKeyboardFlugin.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "WnKeyboardFlugin.h"
#import "NumPswTextField.h"
#import "WNPayView.h"
#import "WNAlphaTextField.h"
static   NumPswTextField *numTextField ;
static   WNPayView *payView;
static  WNAlphaTextField *alphaTextField;
@interface WnKeyboardFlugin()
@end

@implementation WnKeyboardFlugin
- (void)showNumberKeyboard{
    
    numTextField = [[NumPswTextField alloc]initWithFrame:CGRectZero];
    [[UIApplication sharedApplication].keyWindow addSubview:numTextField];
    [numTextField becomeFirstResponder];
    
}

- (void)showPayKeyboard{
    [numTextField resignFirstResponder];
    [alphaTextField resignFirstResponder];
    payView = [[WNPayView alloc]init];
    [[UIApplication sharedApplication].keyWindow addSubview:payView];
    [payView show];
    
}
- (void)showAlphaKeyboard{
    alphaTextField = [[WNAlphaTextField alloc]init];
    [[UIApplication sharedApplication].keyWindow addSubview:alphaTextField];
    [alphaTextField becomeFirstResponder];
}
- (void)hideKeyboard{
    
    [numTextField resignFirstResponder];
    [alphaTextField resignFirstResponder];
}

- (void)removeNumKeyboard{
    
    [numTextField resignFirstResponder];
    [numTextField removeFromSuperview];
}

- (void)changeText:(NumPswTextField *)textField{
    NSLog(@"%@",textField.text);
}

@end
