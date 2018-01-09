//
//  PayView.h
//  FuDianBank
//
//  Created by 汪宁 on 2017/10/23.
//  Copyright © 2017年 WN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayView : UIView

@property (nonatomic, strong)UIWebView *webView;
- (instancetype)initWithParams:(NSDictionary *)param numList:(NSArray *)array;

@end
