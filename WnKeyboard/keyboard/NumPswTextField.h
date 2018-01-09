//
//  BCNumPswTextField.h
//  GSWJR
//
//  Created by 汪宁 on 2017/12/22.
//  Copyright © 2017年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumPswTextFieldDelegate;

@interface NumPswTextField : UITextField

@property(nonatomic, copy)NSString * passwordStr;
@property(nonatomic, weak)id <NumPswTextFieldDelegate>numDelegate;

@end

@protocol NumPswTextFieldDelegate <NSObject>
- (void)changeText:(NumPswTextField *)textField;
@end
