//
//  PassTextFild.m
//  VisionField
//
//  Created by 邓 连喜 on 14-8-22.
//  Copyright (c) 2014年 邓 连喜. All rights reserved.
//

#import "PassTextFild.h"

#define FIT_X          [UIScreen mainScreen].bounds.size.width/320.000
#define iPhone4        ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation PassTextFild
@synthesize otherKeyBoardView=_otherKeyBoardView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadBegin];
    }
    return self;
}

-(void)loadBegin
{
    keyBoardView =[[UIView alloc]initWithFrame:CGRectMake(0, 480-220, 320, 220)];
    if (iPhone4) {
        keyBoardView.frame =CGRectMake(0, 480-220, 320, 220);
    }else{
        keyBoardView.frame =CGRectMake(0, 568*FIT_X-240*FIT_X, 320*FIT_X, 220*FIT_X);
    }
    keyBoardView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgs.png"]];
    
    CGFloat leftMargin = 1;
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"keyBoard" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    //第一排
    for (int i=0; i<10; i++)
    {
        UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        pressButton.tag =i+200;
        pressButton.frame =CGRectMake(1+i*32*FIT_X, 5*FIT_X, 34*FIT_X, 48*FIT_X);
        [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
        [keyBoardView addSubview:pressButton];
        
        UILabel *descripSecLabel =[[UILabel alloc] init];
        descripSecLabel.tag = 2000+i;
        descripSecLabel.frame =pressButton.frame;
        descripSecLabel.backgroundColor =[UIColor clearColor];
        descripSecLabel.textAlignment =NSTextAlignmentCenter;
        descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
      
        NSString *keyValue=[NSString stringWithFormat:@"%ld",pressButton.tag];
        descripSecLabel.text = dic[keyValue];
        
        [keyBoardView addSubview:descripSecLabel];
        
    }
    
    //第二排
    for (int i=0; i<10; i++)
    {
        UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        pressButton.tag =i+210;
        pressButton.frame =CGRectMake(1+i*32*FIT_X,  59*FIT_X, 34*FIT_X, 48*FIT_X);
        [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
        [keyBoardView addSubview:pressButton];
        
        UILabel *descripSecLabel =[[UILabel alloc] init];
        descripSecLabel.tag = 2010+i;
        descripSecLabel.frame =pressButton.frame;
        descripSecLabel.backgroundColor =[UIColor clearColor];
        descripSecLabel.textAlignment =NSTextAlignmentCenter;
        descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        NSString *keyValue=[NSString stringWithFormat:@"%ld",pressButton.tag];
        descripSecLabel.text = dic[keyValue];
        [keyBoardView addSubview:descripSecLabel];
        
    }
    
    
    //第三排
    CGFloat thirdMargin = 3;
    CGFloat thirdWidth = (320-2*leftMargin- 6*thirdMargin)/7*FIT_X;
    
    
    for (int i=0; i<5; i++)
    {
        UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
        [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
        pressButton.tag =i+220;
        pressButton.frame =CGRectMake(1+(thirdWidth+thirdMargin)*(i+1), 113*FIT_X, thirdWidth, 49*FIT_X);
        [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
        [keyBoardView addSubview:pressButton];
        
        UILabel *descripSecLabel =[[UILabel alloc] init];
        descripSecLabel.tag = 2020+i;
        descripSecLabel.frame =pressButton.frame;
        descripSecLabel.backgroundColor =[UIColor clearColor];
        descripSecLabel.textAlignment =NSTextAlignmentCenter;
        descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        
        NSString *keyValue=[NSString stringWithFormat:@"%ld",pressButton.tag];
        descripSecLabel.text = dic[keyValue];
        
        [keyBoardView addSubview:descripSecLabel];
    }
    
    //  切换符号

    pressButtonSymbol =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonSymbol.frame =CGRectMake(1, 113*FIT_X, thirdWidth, 49*FIT_X);
    [pressButtonSymbol setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
    [pressButtonSymbol setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
    [pressButtonSymbol setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateSelected];
    [pressButtonSymbol setTitle:@"#+=" forState:UIControlStateNormal];
    [pressButtonSymbol addTarget:self action:@selector(pressSymbolAction) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonSymbol];
    
    
    //减
    UIButton *pressButtondelete =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtondelete.frame =CGRectMake(272*FIT_X, 113*FIT_X, 43*FIT_X, 49*FIT_X);
    [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
    [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
    [pressButtondelete addTarget:self action:@selector(deleteTextField) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtondelete];
    UIImageView *backGrodImage =[[UIImageView alloc]initWithFrame:CGRectMake(277*FIT_X, 123*FIT_X, 32*FIT_X, 28*FIT_X)];
    backGrodImage.image =[UIImage imageNamed:@"tu2 (3).png"];
    [keyBoardView addSubview:backGrodImage];
    

    
    
    //ABC
    UIButton *pressButtonReturn =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonReturn.frame =CGRectMake(0, 167*FIT_X, 80*FIT_X, 49*FIT_X);
    [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
    [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
    [pressButtonReturn addTarget:self action:@selector(changeAbcKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonReturn];
    
    UILabel *pressButtonReturnLabel =[[UILabel alloc] init];
    pressButtonReturnLabel.frame =pressButtonReturn.frame;
    pressButtonReturnLabel.backgroundColor =[UIColor clearColor];
    pressButtonReturnLabel.textColor =[UIColor whiteColor];
    pressButtonReturnLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonReturnLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonReturnLabel.text =@"ABC";
    [keyBoardView addSubview:pressButtonReturnLabel];
    
    //空格
    UIButton *pressButtonZeroTwo =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonZeroTwo.frame =CGRectMake(80*FIT_X, 167*FIT_X, 160*FIT_X, 49*FIT_X);
    [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 (2).png"] forState:UIControlStateNormal];
    [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 2.png"] forState:UIControlStateHighlighted];
    pressButtonZeroTwo.tag =24;
    [pressButtonZeroTwo addTarget:self action:@selector(addNullAction) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonZeroTwo];
    
    UILabel *pressButtonZeroTwoLabel =[[UILabel alloc] init];
    pressButtonZeroTwoLabel.frame =pressButtonZeroTwo.frame;
    pressButtonZeroTwoLabel.backgroundColor =[UIColor clearColor];
    pressButtonZeroTwoLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonZeroTwoLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonZeroTwoLabel.text =@"空格";
    [keyBoardView addSubview:pressButtonZeroTwoLabel];
    
    //确认
    UIButton *pressButtonSearch =[UIButton buttonWithType:UIButtonTypeCustom];
    pressButtonSearch.frame =CGRectMake(240*FIT_X, 167*FIT_X, 80*FIT_X, 49*FIT_X);
    [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
    [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
    [pressButtonSearch addTarget:self action:@selector(conformInput) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardView addSubview:pressButtonSearch];
    
    UILabel *pressButtonSearchLabel =[[UILabel alloc] init];
    pressButtonSearchLabel.frame =pressButtonSearch.frame;
    pressButtonSearchLabel.backgroundColor =[UIColor clearColor];
    pressButtonSearchLabel.textColor =[UIColor whiteColor];
    pressButtonSearchLabel.textAlignment =NSTextAlignmentCenter;
    pressButtonSearchLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
    pressButtonSearchLabel.text =@"确认";
    [keyBoardView addSubview:pressButtonSearchLabel];
    
    
    self.inputView =keyBoardView;
}
- (void)pressSymbolAction{
    NSString * plistPath = [[NSBundle mainBundle]pathForResource:@"keyBoard" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSInteger tag ;
    
    UILabel *label =[keyBoardView viewWithTag:2000];
    if ([label.text isEqualToString:@"["]) {
        tag = 200;
    }else {
        tag = 300;
    }
    
    for (int i = 0; i<20; ++i) {
        UILabel *label =[keyBoardView viewWithTag:2000+i];
        
        NSString *keyValue = [NSString stringWithFormat:@"%ld",tag+i];
        label.text = dic[keyValue];
        if (tag == 200) {
             UIButton *button = [keyBoardView viewWithTag:300+i];
            button.tag = 200+i;
        }else {
            UIButton *button = [keyBoardView viewWithTag:200+i];
            button.tag = 300+i;
        }
       
        
        
    }
    
    
    
}
- (void)conformInput{
    [self resignFirstResponder];
}

-(void)goPress:(UIButton *)btn
{
    NSInteger number = btn.tag;
    if (number==10) {
        number =0;
    }
    
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%ld", self.text, number];
    self.text = mutableString;
    
   // [self searchAllTextField];
}

-(void)goPressOtherButtons:(UIButton *)btn
{
    
    NSString *addString=@"";
    if (btn.tag==20) {
        addString =@"600";
    }
    else if (btn.tag==21)
    {
        addString =@"601";
    }
    else if (btn.tag==22)
    {
        addString =@"000";
    }
    else if (btn.tag==23)
    {
        addString =@"300";
    }
    else if (btn.tag==24)
    {
        addString =@"002";
    }
    
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%@", self.text, addString];
    self.text = mutableString;
    
    //[self searchAllTextField];
}


//删除一位
-(void)deleteTextField
{
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@", self.text];
    if ([mutableString length] > 0) {
        NSRange tmpRange;
        tmpRange.location = [mutableString length] - 1;
        tmpRange.length = 1;
        [mutableString deleteCharactersInRange:tmpRange];
    }
    self.text = mutableString;
    
   // [self searchAllTextField];
}

//清除
-(void)clearAllTextField
{
    self.text =@"";
}


//alertView 自动消失；
- (void)removeAlertView:(UIAlertView *)alertView
{
    [alertView dismissWithClickedButtonIndex:[alertView cancelButtonIndex] animated:YES];
    [alertView removeFromSuperview];
}

//隐藏
-(void)goReturn
{
    [self resignFirstResponder];
}

-(CGRect)frameForSettingButtonUnderImage:(NSInteger)index
{
    CGFloat x;
    CGFloat y;
    int indexHeight;
    int height;
    indexHeight =60*FIT_X;
    height =5*FIT_X;
    
    if(index%3==0)
    {
        x =68*FIT_X;
        y =height +index/3 *indexHeight;
    }
    else if (index%3==1)
    {
        x =131*FIT_X;
        y =height +index/3 *indexHeight;
    }
    else
    {
        x =194*FIT_X;
        y =height +index/3*indexHeight;
    }
    
    if (index==9)
    {
        return CGRectMake(131*FIT_X, 185*FIT_X, 58*FIT_X, 55*FIT_X);
    }
    return CGRectMake(x,y,58*FIT_X,55*FIT_X);
}

//切换到abc键盘
-(void)changeAbcKeyBoard
{
    if (!self.otherKeyBoardView) {
        self.otherKeyBoardView =[[UIView alloc]initWithFrame:CGRectMake(0, 568-240, 320, 220)];
        if (iPhone4) {
            self.otherKeyBoardView.frame =CGRectMake(0, 480-220, 320, 220);
        }else{
            self.otherKeyBoardView.frame =CGRectMake(0, 568*FIT_X-240*FIT_X, 320*FIT_X, 220*FIT_X);
        }
        self.otherKeyBoardView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgs.png"]];
        
        //第一排
        for (int i=0; i<10; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+100;
            pressButton.frame =CGRectMake(1+i*32*FIT_X, 5*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"Q";
                    break;
                case 1:
                    descripSecLabel.text =@"W";
                    break;
                case 2:
                    descripSecLabel.text =@"E";
                    break;
                case 3:
                    descripSecLabel.text =@"R";
                    break;
                case 4:
                    descripSecLabel.text =@"T";
                    break;
                case 5:
                    descripSecLabel.text =@"Y";
                    break;
                case 6:
                    descripSecLabel.text =@"U";
                    break;
                case 7:
                    descripSecLabel.text =@"I";
                    break;
                case 8:
                    descripSecLabel.text =@"O";
                    break;
                case 9:
                    descripSecLabel.text =@"P";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
            
        }
        
        //第二排
        for (int i=0; i<9; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+110;
            pressButton.frame =CGRectMake(16*FIT_X+i*32*FIT_X, 59*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"A";
                    break;
                case 1:
                    descripSecLabel.text =@"S";
                    break;
                case 2:
                    descripSecLabel.text =@"D";
                    break;
                case 3:
                    descripSecLabel.text =@"F";
                    break;
                case 4:
                    descripSecLabel.text =@"G";
                    break;
                case 5:
                    descripSecLabel.text =@"H";
                    break;
                case 6:
                    descripSecLabel.text =@"J";
                    break;
                case 7:
                    descripSecLabel.text =@"K";
                    break;
                case 8:
                    descripSecLabel.text =@"L";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
            
        }
        
        //第三排
        for (int i=0; i<7; i++)
        {
            UIButton *pressButton =[UIButton buttonWithType:UIButtonTypeCustom];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 (2).png"] forState:UIControlStateNormal];
            [pressButton setBackgroundImage:[UIImage imageNamed:@"tu1 2.png"] forState:UIControlStateHighlighted];
            pressButton.tag =i+120;
            pressButton.frame =CGRectMake(46*FIT_X+i*32*FIT_X, 113*FIT_X, 34*FIT_X, 48*FIT_X);
            [pressButton addTarget:self action:@selector(goPressSecondKeyButtons:) forControlEvents:UIControlEventTouchUpInside];
            [self.otherKeyBoardView addSubview:pressButton];
            
            UILabel *descripSecLabel =[[UILabel alloc] init];
            descripSecLabel.frame =pressButton.frame;
            descripSecLabel.backgroundColor =[UIColor clearColor];
            descripSecLabel.textAlignment =NSTextAlignmentCenter;
            descripSecLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
            switch (i)
            {
                case 0:
                    descripSecLabel.text =@"Z";
                    break;
                case 1:
                    descripSecLabel.text =@"X";
                    break;
                case 2:
                    descripSecLabel.text =@"C";
                    break;
                case 3:
                    descripSecLabel.text =@"V";
                    break;
                case 4:
                    descripSecLabel.text =@"B";
                    break;
                case 5:
                    descripSecLabel.text =@"N";
                    break;
                case 6:
                    descripSecLabel.text =@"M";
                    break;
                default:
                    break;
            }
            [self.otherKeyBoardView addSubview:descripSecLabel];
        }
        
        //减
        UIButton *pressButtondelete =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtondelete.frame =CGRectMake(272*FIT_X, 113*FIT_X, 43*FIT_X, 49*FIT_X);
        [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
        [pressButtondelete setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
        [pressButtondelete addTarget:self action:@selector(deleteTextField) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtondelete];
        
        UIImageView *backGrodImage =[[UIImageView alloc]initWithFrame:CGRectMake(277*FIT_X, 123*FIT_X, 32*FIT_X, 28*FIT_X)];
        backGrodImage.image =[UIImage imageNamed:@"tu2 (3).png"];
        [self.otherKeyBoardView addSubview:backGrodImage];
        
        //大写
        pressButtonCapital =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonCapital.frame =CGRectMake(1, 113*FIT_X, 43*FIT_X, 49*FIT_X);
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 2.png"] forState:UIControlStateNormal];
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonCapital setBackgroundImage:[UIImage imageNamed:@"tu2 (2).png"] forState:UIControlStateSelected];
        [pressButtonCapital addTarget:self action:@selector(pressCapitalAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonCapital];
        
        bacDaXieImage =[[UIImageView alloc]initWithFrame:CGRectMake(7*FIT_X, 123*FIT_X, 31*FIT_X, 27*FIT_X)];
        bacDaXieImage.image =[UIImage imageNamed:@"da_.png"];
        [self.otherKeyBoardView addSubview:bacDaXieImage];
        
        //123
        UIButton *pressButtonReturn =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonReturn.frame =CGRectMake(0, 167*FIT_X, 80*FIT_X, 49*FIT_X);
        [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
        [pressButtonReturn setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonReturn addTarget:self action:@selector(changeNumberKeyBoard) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonReturn];
        
        UILabel *pressButtonReturnLabel =[[UILabel alloc] init];
        pressButtonReturnLabel.frame =pressButtonReturn.frame;
        pressButtonReturnLabel.backgroundColor =[UIColor clearColor];
        pressButtonReturnLabel.textColor =[UIColor whiteColor];
        pressButtonReturnLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonReturnLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonReturnLabel.text =@".?123";
        [self.otherKeyBoardView addSubview:pressButtonReturnLabel];
        
        //空格
        UIButton *pressButtonZeroTwo =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonZeroTwo.frame =CGRectMake(80*FIT_X, 167*FIT_X, 160*FIT_X, 49*FIT_X);
        [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 (2).png"] forState:UIControlStateNormal];
        [pressButtonZeroTwo setBackgroundImage:[UIImage imageNamed:@"tu4 2.png"] forState:UIControlStateHighlighted];
        pressButtonZeroTwo.tag =24;
        [pressButtonZeroTwo addTarget:self action:@selector(addNullAction) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonZeroTwo];
        
        UILabel *pressButtonZeroTwoLabel =[[UILabel alloc] init];
        pressButtonZeroTwoLabel.frame =pressButtonZeroTwo.frame;
        pressButtonZeroTwoLabel.backgroundColor =[UIColor clearColor];
        pressButtonZeroTwoLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonZeroTwoLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonZeroTwoLabel.text =@"空格";
        [self.otherKeyBoardView addSubview:pressButtonZeroTwoLabel];
        
        //搜索
        UIButton *pressButtonSearch =[UIButton buttonWithType:UIButtonTypeCustom];
        pressButtonSearch.frame =CGRectMake(240*FIT_X, 167*FIT_X, 80*FIT_X, 49*FIT_X);
        [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-4"] forState:UIControlStateNormal];
        [pressButtonSearch setBackgroundImage:[UIImage imageNamed:@"tu3-04 (2).png"] forState:UIControlStateHighlighted];
        [pressButtonSearch addTarget:self action:@selector(conformInput) forControlEvents:UIControlEventTouchUpInside];
        [self.otherKeyBoardView addSubview:pressButtonSearch];
        
        UILabel *pressButtonSearchLabel =[[UILabel alloc] init];
        pressButtonSearchLabel.frame =pressButtonSearch.frame;
        pressButtonSearchLabel.backgroundColor =[UIColor clearColor];
        pressButtonSearchLabel.textColor =[UIColor whiteColor];
        pressButtonSearchLabel.textAlignment =NSTextAlignmentCenter;
        pressButtonSearchLabel.font =[UIFont fontWithName:@"STHeitiSC-Light" size:18*FIT_X];
        pressButtonSearchLabel.text =@"确认";
        [self.otherKeyBoardView addSubview:pressButtonSearchLabel];
    }
    self.inputView =self.otherKeyBoardView;
    [self reloadInputViews];
}

-(void)goPressSecondKeyButtons:(UIButton *)btn
{
  NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"keyBoard" ofType:@"plist"];
    
  NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
  NSString *keyValue = [NSString stringWithFormat:@"%ld",btn.tag];
    
  NSString *addString=dic[keyValue];
    
    
    if (pressButtonCapital.selected)
    {
        addString =[addString uppercaseString];
    }
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@%@", self.text, addString];
    self.text = mutableString;
   // [self searchAllTextField];
    
    
    
    
}

//切换到123键盘
-(void)changeNumberKeyBoard
{
    self.inputView =keyBoardView;
    [self reloadInputViews];
}

//空格
-(void)addNullAction
{
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@ ", self.text];
    self.text = mutableString;
    
   // [self searchAllTextField];
}

//大小写切换
-(void)pressCapitalAction:(UIButton *)button
{
    if (button.selected)
    {
        button.selected =NO;
        bacDaXieImage.image =[UIImage imageNamed:@"da_.png"];
    }
    else
    {
        button.selected =YES;
        bacDaXieImage.image =[UIImage imageNamed:@"da.png"];
    }
}
@end
