//
//  PayView.m
//  FuDianBank
//
//  Created by 汪宁 on 2017/10/23.
//  Copyright © 2017年 WN. All rights reserved.
//

#import "PayView.h"
#import "PasswordTextField.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BeginTag 1899


@interface PayView ()<UITextFieldDelegate>
@property(nonatomic, strong) UIView *topView;
@property (strong, nonatomic) NSMutableArray *boxes;
@property (strong, nonatomic)PasswordTextField *  myTextField;
@property (strong, nonatomic)UITextField *  CVN2TextField;
@property (nonatomic, strong)NSArray *numArray;
@property (nonatomic, copy) NSString *passwordStr;
@property (nonatomic, strong) NSDictionary *params;
@end

@implementation PayView

- (instancetype)initWithParams:(NSDictionary *)param numList:(NSArray *)array{
    if (self = [super init]) {
       
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        self.numArray = [NSArray arrayWithArray:array];
        _params = [[NSDictionary alloc]init];
        _params = param;
        _passwordStr = @"";
        [self createTopView];
        
    }
    return self;
    
}
- (void)createTopView{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight*0.34, ScreenWidth, ScreenHeight*0.66)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_topView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, 50)];
    label.text = @"请输入支付密码";
    label.textColor = UIColorFromRGB(0x333333);
    label.textAlignment = NSTextAlignmentCenter;
    [_topView addSubview:label];
    
    UIView *lineView= [[UIView alloc]initWithFrame:CGRectMake(0, 50, ScreenWidth, 0.5)];
    lineView.backgroundColor = UIColorFromRGB(0xd9d9d9);
    [_topView addSubview:lineView];
  
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:button];
    [self createTextFields];
    
    [self createButton];

}

- (void)createButton{

    UIView *boardBgView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight*0.32, ScreenWidth, ScreenHeight*0.34)];
    boardBgView.backgroundColor = UIColorFromRGB(0xe3e7ee);
    [_topView addSubview:boardBgView];
    
    CGFloat space = 6;
    CGFloat width = (ScreenWidth- space*4)/3;
    CGFloat height = (ScreenHeight*0.34-space*5)/4;
    for (int i= 0; i<12; ++i) {
       
        NSInteger m = i%3;
        NSInteger n = i/3;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(space+(width+space)*m, space+(space+height)*n, width, height)];
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(clickPswNum:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = BeginTag+i;
        button.layer.masksToBounds =YES;
        button.layer.cornerRadius = 5;
        button.adjustsImageWhenHighlighted = NO;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [boardBgView addSubview:button];
        
        if (i<9) {
            NSString *imageStr = _numArray[i][@"src"];
            NSData *imageData = [[NSData alloc]
                                              initWithBase64EncodedString: imageStr options:0];
            
            UIImage *image = [UIImage imageWithData:imageData];
            CGSize imageSize = image.size;
            CGFloat ratio = imageSize.width/imageSize.height;
           // image = [self OriginImage:image scaleToSize:CGSizeMake(ratio*height, height)];
            [button setImage:image forState:UIControlStateNormal];
            
        }
        
        if (i==10) {
            NSString *imageStr = _numArray[9][@"src"];
            NSData *imageData = [[NSData alloc]
                                 initWithBase64EncodedString: imageStr options:0];
            
            UIImage *image = [UIImage imageWithData:imageData];
            CGSize imageSize = image.size;
            CGFloat ratio = imageSize.width/imageSize.height;
            
            //image = [self OriginImage:image scaleToSize:CGSizeMake(ratio*height, height)];
            [button setImage:image forState:UIControlStateNormal];
        }
        if (i==9) {
            button.backgroundColor = [UIColor clearColor];
        }
        if (i==11) {
            button.backgroundColor = [UIColor clearColor];
            [button setImage:[UIImage imageNamed:@"deleIma"] forState:UIControlStateNormal];
        }
        
        
    }
    
    
   
    
}
- (void)createTextFields{
    CGFloat sideLength = 45;
    CGFloat sideWidth = ScreenWidth -50;
    _myTextField = [[PasswordTextField alloc]initWithFrame:CGRectMake((ScreenWidth- sideWidth)/2, 90, sideWidth, sideLength)];
    [_topView addSubview:_myTextField];

}


- (void)clickPswNum:(UIButton *)button{
    NSInteger num = button.tag-BeginTag;
    if (num== 9) {
        return;
    }
    if (num == 10) {
        num =9;
    }
    // 删除
    if (num == 11) {
        if (_passwordStr.length>0) {
            UIView *view =   _myTextField.dotArray[_passwordStr.length-1];
            view.hidden = YES;
             _passwordStr = [_passwordStr substringToIndex:_passwordStr.length-1];
        }
       
        return;
    }
   
   
        NSDictionary *dic= _numArray[num];
        NSString *code  =dic[@"code"];
   
       _passwordStr =   [_passwordStr stringByAppendingString:code];
       UIView *view =   _myTextField.dotArray[_passwordStr.length-1];
       view.hidden = NO;
    // 输入
    if (_passwordStr.length>=6) {
        // 验证密码
        NSString *uid =[_numArray lastObject];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RETURNPSW" object:@{@"uid":uid,@"password":_passwordStr}];
        _passwordStr = @"";
         [self cancel];
        return;
    }
    
   
}

- (void)cancel{
    
    self.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
    _passwordStr = @"";
    
    
    
    NSDictionary *dic = @{@"uid":@"",@"password":@""};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString * str  = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
      NSString *callback = _params[@"callBack"];
    NSString *js = [NSString stringWithFormat:@"%@(%@)",callback,str];
    
    [self.webView stringByEvaluatingJavaScriptFromString:js];
    
    [self removeFromSuperview];
    
}
- (void)choose{
    
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
    else if(textField.text.length >= 4) {
       
        NSLog(@"输入的字符个数大于4，忽略输入");
        return NO;
    } else {
        return YES;
    }
}

- (void)textFieldDidChange:(UITextField *)textField
{
    
    if (textField.text.length == 4) {
        NSLog(@"输入完毕");
    }
}
#pragma mark 处理图片
-(UIImage*) OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}



@end
