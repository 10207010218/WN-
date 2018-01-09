//
//  PayView.h
//  FuDianBank
//
//  Created by 汪宁 on 2017/10/23.
//  Copyright © 2017年 WN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNPayView : UIView

@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)NSArray *numListArray;
- (void)show;

@end
