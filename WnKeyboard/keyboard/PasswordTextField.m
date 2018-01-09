//
//  PasswordTextField.m
//  FuDianBank
//
//  Created by 汪宁 on 2017/10/23.
//  Copyright © 2017年 WN. All rights reserved.
//

#import "PasswordTextField.h"

#define kDotSize CGSizeMake (10, 10) //密码点的大小
#define kDotCount 6  //密码个数
#define K_Field_Height 45  //每一个输入框的高度

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface PasswordTextField ()<UITextFieldDelegate>

@end


@implementation PasswordTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        //输入的文字颜色为白色
        self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        //输入框光标的颜色为白色
        self.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.delegate = self;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.keyboardType = UIKeyboardTypeNumberPad;
       // self.layer.borderColor = UIColorFromRGB(0xa7a7a7).CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius =5;
        self.layer.masksToBounds = YES;
        
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self initPwdTextField];
        
    }
    return self;
}




- (void)initPwdTextField
{
    //每个密码输入框的宽度
    CGFloat width = self.frame.size.width/6;
    CGFloat height =self.frame.size.height;
    
    //生成分割线
    for (int i = 0; i < kDotCount - 1; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake((i + 1) * width, 0, 1, height)];
        lineView.backgroundColor = UIColorFromRGB(0xa7a7a7);
        [self addSubview:lineView];
    }
    
    self.dotArray = [[NSMutableArray alloc] init];
    //生成中间的点
    for (int i = 0; i < kDotCount; i++) {
        UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake((width - kDotCount) / 2 + i * width,  (K_Field_Height - kDotSize.height) / 2, kDotSize.width, kDotSize.height)];
        dotView.backgroundColor = [UIColor blackColor];
        dotView.layer.cornerRadius = kDotSize.width / 2.0f;
        dotView.clipsToBounds = YES;
        dotView.hidden = YES; //先隐藏
        [self addSubview:dotView];
        //把创建的黑色点加入到数组中
        [self.dotArray addObject:dotView];
    }
}



-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
   
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"变化%@", string);
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if(string.length == 0) {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= kDotCount) {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        NSLog(@"输入的字符个数大于6，忽略输入");
        return NO;
    } else {
        return YES;
    }
}

- (void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    for (UIView *dotView in self.dotArray) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotArray objectAtIndex:i]).hidden = NO;
    }
    if (textField.text.length == kDotCount) {
        NSLog(@"输入完毕");
    }
   
}



@end
