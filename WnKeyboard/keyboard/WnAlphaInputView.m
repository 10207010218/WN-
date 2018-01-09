//
//  WnAlphaInputView.m
//  WnKeyBoard
//
//  Created by 汪宁 on 2018/1/9.
//  Copyright © 2018年 WN. All rights reserved.
//

#import "WnAlphaInputView.h"
#import "WnButton.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface WnAlphaInputView ()

@property(nonatomic, copy)NSString * passwordStr;

@property(nonatomic, strong)UIView *alphaView;
@property(nonatomic, strong)UIView *symbolView;

@property(nonatomic, strong)NSMutableArray *alphaFirstArray;
@property(nonatomic, copy)NSString  *alphaFirstContent;
@property(nonatomic, strong)NSMutableArray *alphaSecondArray;
@property(nonatomic, copy)NSString *alphaSecondContent;
@property(nonatomic, strong)NSMutableArray *alphaThirdArray;
@property(nonatomic, copy)NSString *alphaThirdContent;
@property(nonatomic, strong)NSMutableArray *charFirstArray;
@property(nonatomic, copy)NSString *charFirstContent;
@property(nonatomic, strong)NSMutableArray *charSecondArray;
@property(nonatomic, copy)NSString *charSecondContent;
@property(nonatomic, strong)NSMutableArray *charThirdArray;
@property(nonatomic, copy)NSString *charThirdContent;

@property(nonatomic, strong)WnButton *capitalButton;
@property(nonatomic, strong)WnButton *deleteButton;
@property(nonatomic, strong)WnButton *switchButton;
@property(nonatomic, strong)WnButton *conformButton;
@property(nonatomic, strong)WnButton *symbolMoreButton;
@property(nonatomic, strong)UIImageView *logoImageView;


@end

@implementation WnAlphaInputView

- (instancetype)init{
    if (self = [super init]) {
        _passwordStr = @"";
        CGFloat verticalSpace = 4;
        CGFloat horizonSpace = 3;
        CGFloat buttonWidth = (ScreenWidth - 10*horizonSpace)/10;
        CGFloat buttonHeight = 1.4 *buttonWidth;
         self.frame = CGRectMake(0, 0,ScreenWidth , (buttonHeight*4+verticalSpace*3)+5);
        _alphaFirstArray = [[NSMutableArray alloc]init];
        _alphaSecondArray = [[NSMutableArray alloc]init];
        _alphaThirdArray = [[NSMutableArray alloc]init];
        
        _alphaFirstContent =@"qwertyuiop";
        _alphaSecondContent = @"asdfghjkl";
        _alphaThirdContent = @"zxcvbnm";
        
        _charFirstArray = [[NSMutableArray alloc]init];
        _charSecondArray = [[NSMutableArray alloc]init];
        _charThirdArray = [[NSMutableArray alloc]init];
        
        _charFirstContent =@"1234567890";
        _charSecondContent = @"-/:;()$&@\"";
        _charThirdContent = @".,?!'";
        
        [self createAlpheView];
       
    }
    return self;
}
- (void)layoutSubviews{
    CGFloat verticalSpace = 4;
    CGFloat horizonSpace = 3;
    CGFloat buttonWidth = (ScreenWidth - 10*horizonSpace)/10;
    CGFloat buttonHeight = 1.4 *buttonWidth;
   
    for (int i = 0;i<_alphaFirstArray.count;++i) {
        UIButton *button = [_alphaFirstArray objectAtIndex:i];
        button.frame =  CGRectMake(horizonSpace/2+(buttonWidth+horizonSpace)*i, 0, buttonWidth, buttonHeight);
    }
    
    for (int i = 0;i<_alphaSecondArray.count;++i) {
        UIButton *button = [_alphaSecondArray objectAtIndex:i];
        button.frame =  CGRectMake(horizonSpace+buttonWidth/2+(buttonWidth+horizonSpace)*i, buttonHeight+verticalSpace, buttonWidth, buttonHeight);
    }
    
    for (int i = 0;i<_alphaThirdArray.count;++i) {
        UIButton *button = [_alphaThirdArray objectAtIndex:i];
        button.frame =  CGRectMake(horizonSpace*2+buttonWidth*1.5+(buttonWidth+horizonSpace)*i, (buttonHeight+verticalSpace)*2, buttonWidth, buttonHeight);
    }
    
    _capitalButton.frame = CGRectMake(horizonSpace/2, (buttonHeight+verticalSpace)*2, buttonWidth*1.5, buttonHeight);
    _deleteButton.frame = CGRectMake(ScreenWidth- horizonSpace/2-buttonWidth*1.5, (buttonHeight+verticalSpace)*2, buttonWidth*1.5, buttonHeight);
    _switchButton.frame = CGRectMake(horizonSpace/2, (buttonHeight+verticalSpace)*3, buttonWidth*2, buttonHeight);
    _conformButton.frame = CGRectMake(ScreenWidth- horizonSpace/2-buttonWidth*2, (buttonHeight+verticalSpace)*3, buttonWidth*2, buttonHeight);
    _logoImageView.frame = CGRectMake(buttonWidth*2.5, (buttonHeight+verticalSpace)*3, ScreenWidth- buttonWidth*5, buttonHeight);
    _symbolMoreButton.frame = CGRectMake(horizonSpace/2, (buttonHeight+verticalSpace)*2, buttonWidth*1.5, buttonHeight);
    
    //
    
    
    for (int i = 0;i<_charFirstArray.count;++i) {
        UIButton *button = [_charFirstArray objectAtIndex:i];
        button.frame =  CGRectMake(horizonSpace/2+(buttonWidth+horizonSpace)*i, 0, buttonWidth, buttonHeight);
    }
    
    for (int i = 0;i<_charSecondArray.count;++i) {
        UIButton *button = [_charSecondArray objectAtIndex:i];
         button.frame =  CGRectMake(horizonSpace/2+(buttonWidth+horizonSpace)*i, buttonHeight+verticalSpace, buttonWidth, buttonHeight);
    }
    
    for (int i = 0;i<_charThirdArray.count;++i) {
        UIButton *button = [_charThirdArray objectAtIndex:i];
        button.frame =  CGRectMake(horizonSpace*3+buttonWidth*1.5+(buttonWidth*1.4+horizonSpace)*i, (buttonHeight+verticalSpace)*2, buttonWidth*1.4, buttonHeight);
    }
    
    
    
}
- (void)createAlpheView{
    
    _alphaView = [[UIView alloc]initWithFrame:self.bounds];
    _alphaView.backgroundColor = [UIColor colorWithRed:0.82f green:0.84f blue:0.86f alpha:1.00f];
     [self addSubview:_alphaView];
    // 第一排
    for (int i=0; i<10; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
        //[pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        //[pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
       
        NSString *title =[NSString stringWithFormat:@"%c",[_alphaFirstContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_alphaView addSubview:pressButton];
        [_alphaFirstArray addObject:pressButton];
        
    }
    
    for (int i=0; i<9; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        [pressButton setTintColor:[UIColor blackColor]];
         NSString *title =[NSString stringWithFormat:@"%c",[_alphaSecondContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_alphaView addSubview:pressButton];
        [_alphaSecondArray addObject:pressButton];
        
    }
    
    for (int i=0; i<7; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        [pressButton setTintColor:[UIColor blackColor]];
         NSString *title =[NSString stringWithFormat:@"%c",[_alphaThirdContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_alphaView addSubview:pressButton];
        [_alphaThirdArray addObject:pressButton];
        
    }
    
    _capitalButton = [[WnButton alloc]init];
    _capitalButton.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.94f alpha:1.00f];
    [_capitalButton setImage:[UIImage imageNamed:@"bigCase"] forState:UIControlStateNormal];
    [_capitalButton addTarget:self action:@selector(textTransform) forControlEvents:UIControlEventTouchUpInside];
    [_alphaView addSubview:_capitalButton];
    
    _deleteButton = [[WnButton alloc]init];
    _deleteButton.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.94f alpha:1.00f];
    [_deleteButton addTarget:self action:@selector(deleteInput) forControlEvents:UIControlEventTouchUpInside];
    [_deleteButton setImage:[UIImage imageNamed:@"deleIma"] forState:UIControlStateNormal];
    [_alphaView addSubview:_deleteButton];
    
    _switchButton = [[WnButton alloc]init];
    _switchButton.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.94f alpha:1.00f];
    [_switchButton addTarget:self action:@selector(changeToSymbol) forControlEvents:UIControlEventTouchUpInside];
    
    [_switchButton setTitle:@".?123" forState:UIControlStateNormal];
   
    [_alphaView addSubview:_switchButton];
    
    _conformButton = [[WnButton alloc]init];
    _conformButton.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.94f alpha:1.00f];
    [_conformButton addTarget:self action:@selector(conformInput) forControlEvents:UIControlEventTouchUpInside];
   // [_conformButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_conformButton setTitle:@"确认" forState:UIControlStateNormal];
    [_alphaView addSubview:_conformButton];
    _logoImageView = [[UIImageView alloc]init];
    _logoImageView.image = [UIImage imageNamed:@""];
    _logoImageView.layer.masksToBounds = YES;
    _logoImageView.layer.cornerRadius = 4;
    _logoImageView.layer.borderWidth = 0.8;
    _logoImageView.layer.borderColor = UIColorFromRGB(0x999999).CGColor;
    [_alphaView addSubview:_logoImageView];
}
- (void)creeateSymbolView{
    
    _symbolView = [[UIView alloc]initWithFrame:self.bounds];
    _symbolView.backgroundColor = [UIColor colorWithRed:0.82f green:0.84f blue:0.86f alpha:1.00f];
     [self addSubview:_symbolView];
    for (int i=0; i<10; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
    
        NSString *title =[NSString stringWithFormat:@"%c",[_charFirstContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_symbolView addSubview:pressButton];
        [_charFirstArray addObject:pressButton];
        
    }
    
    for (int i=0; i<10; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        [pressButton setTintColor:[UIColor blackColor]];
        NSString *title =[NSString stringWithFormat:@"%c",[_charSecondContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_symbolView addSubview:pressButton];
        [_charSecondArray addObject:pressButton];
        
    }
    
    for (int i=0; i<5; i++)
    {
        WnButton *pressButton =[[WnButton alloc]init];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        [pressButton setTintColor:[UIColor blackColor]];
        NSString *title =[NSString stringWithFormat:@"%c",[_charThirdContent characterAtIndex:i]];
        [pressButton setTitle:title forState:UIControlStateNormal];
        [pressButton addTarget:self action:@selector(goPressButtons:) forControlEvents:UIControlEventTouchUpInside];
        [_symbolView addSubview:pressButton];
        [_charThirdArray addObject:pressButton];
        
    }
    [_symbolView addSubview:_switchButton];
    [_symbolView addSubview:_deleteButton];
    [_symbolView addSubview:_conformButton];
    
    _symbolMoreButton = [[WnButton alloc]init];
    _symbolMoreButton.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.94f alpha:1.00f];
    [_symbolMoreButton addTarget:self action:@selector(changeToMoreSymbol) forControlEvents:UIControlEventTouchUpInside];
    [_symbolMoreButton setTitle:@"#+=" forState:UIControlStateNormal];
    [_symbolView addSubview:_symbolMoreButton];
    
    
    
}
- (void)textTransform{
    
    if ([_alphaFirstContent isEqualToString:@"qwertyuiop"]) {
      _alphaFirstContent = [_alphaFirstContent uppercaseString];
      _alphaSecondContent = [_alphaSecondContent uppercaseString];
       _alphaThirdContent = [_alphaThirdContent uppercaseString];
    }else{
       _alphaFirstContent = [_alphaFirstContent lowercaseString];
       _alphaSecondContent = [_alphaSecondContent lowercaseString];
       _alphaThirdContent = [_alphaThirdContent lowercaseString];
    }
    
    for (int i = 0;i<_alphaFirstArray.count;++i) {
        UIButton *button = [_alphaFirstArray objectAtIndex:i];
        NSString *title =[NSString stringWithFormat:@"%c",[_alphaFirstContent characterAtIndex:i]];
       [button setTitle:title forState:UIControlStateNormal];
    }
    
    for (int i = 0;i<_alphaSecondArray.count;++i) {
        UIButton *button = [_alphaSecondArray objectAtIndex:i];
         NSString *title =[NSString stringWithFormat:@"%c",[_alphaSecondContent characterAtIndex:i]];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    for (int i = 0;i<_alphaThirdArray.count;++i) {
        UIButton *button = [_alphaThirdArray objectAtIndex:i];
        NSString *title =[NSString stringWithFormat:@"%c",[_alphaThirdContent characterAtIndex:i]];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
   
    
}
- (void)changeToSymbol{
    
    
   NSInteger indexSy =  [self.subviews indexOfObject:_symbolView];
   NSInteger indexAl =  [self.subviews indexOfObject:_alphaView];
    if (indexSy>1000) {
        indexSy  = -1;
    }
    if (indexAl>1000) {
        indexAl = -1;
    }
    
    if (indexAl>indexSy) {
        if (!_symbolView) {
            [self creeateSymbolView];
        }
        [self bringOneToFront:_symbolView];
        //[self bringSubviewToFront:_symbolView];
    }else{
        [self bringOneToFront:_alphaView];
      // [self bringSubviewToFront:_alphaView];
    }
    
}
- (void)changeToMoreSymbol{
    if ([_charFirstContent isEqualToString:@"1234567890"]) {
        _charFirstContent = @"[]{}#%^*+=";
        _charSecondContent = @"_\\|~<>$&@.";
    }else{
        _charFirstContent = @"1234567890";
        _charSecondContent = @"-/:;()$&@\"";
    }
    
    for (int i = 0;i<_charFirstArray.count;++i) {
        UIButton *button = [_charFirstArray objectAtIndex:i];
        NSString *title =[NSString stringWithFormat:@"%c",[_charFirstContent characterAtIndex:i]];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    for (int i = 0;i<_charSecondArray.count;++i) {
        UIButton *button = [_charSecondArray objectAtIndex:i];
        NSString *title =[NSString stringWithFormat:@"%c",[_charSecondContent characterAtIndex:i]];
        [button setTitle:title forState:UIControlStateNormal];
    }
}
- (void)bringOneToFront:(UIView *)view{
    
   [self bringSubviewToFront:view];
    [view addSubview:_switchButton];
    [view addSubview:_conformButton];
    [view addSubview:_logoImageView];
    [view addSubview:_deleteButton];
    
    if (view == _alphaView) {
        [_switchButton setTitle:@".?123" forState:UIControlStateNormal];
    }else{
      [_switchButton setTitle:@"ABC" forState:UIControlStateNormal];
    }
    
}

-(void)conformInput{
    
}

- (void)deleteInput{
    if (_passwordStr.length>0) {
        _passwordStr = [_passwordStr substringToIndex:_passwordStr.length-1];
        [self.alphaDelegate changeText:self numString:_passwordStr];
    }
}
- (void)goPressButtons:(UIButton *)button{
    NSString * str = button.titleLabel.text;
    _passwordStr = [_passwordStr stringByAppendingString:str];
    NSLog(@"%@",_passwordStr);
}

@end
