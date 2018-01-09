//
//  ViewController.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "ViewController.h"
#import "WnKeyboardFlugin.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@"数字键盘",@"支付键盘",@"字母键盘",@"隐藏键盘"];
    for (int i= 0; i< 4; ++i) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 80*i+30, 180, 50)];
        button.backgroundColor = [UIColor redColor];
        button.tag = 100+i;
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
}
- (void)click:(UIButton *)button{
    switch (button.tag) {
        case 100:
        {
            WnKeyboardFlugin *flugin = [[WnKeyboardFlugin alloc]init];
            [flugin showNumberKeyboard];
        }
            break;
        case 101:
        {
            WnKeyboardFlugin *flugin = [[WnKeyboardFlugin alloc]init];
            [flugin showPayKeyboard];
        }
            break;
        case 102:
        {
            WnKeyboardFlugin *flugin = [[WnKeyboardFlugin alloc]init];
            [flugin showAlphaKeyboard];
        }
            break;
        case 103:
        { WnKeyboardFlugin *flugin = [[WnKeyboardFlugin alloc]init];
            [flugin hideKeyboard];
            
        }
            break;
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
