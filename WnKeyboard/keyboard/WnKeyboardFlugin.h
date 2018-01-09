//
//  WnKeyboardFlugin.h
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WnKeyboardFlugin : NSObject

- (void)showNumberKeyboard;
- (void)showPayKeyboard;
- (void)showAlphaKeyboard;
- (void)hideKeyboard;
- (void)removeNumKeyboard;

@end
