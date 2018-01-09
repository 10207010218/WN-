//
//  PassTextFild.h
//  VisionField
//
//  Created by 邓 连喜 on 14-8-22.
//  Copyright (c) 2014年 邓 连喜. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PassTextFild : UITextField
{
    UIView *keyBoardView;
    UIButton *pressButtonCapital;
    UIButton *pressButtonSymbol;
    UIImageView *bacDaXieImage;
    NSMutableArray * numContentArray;
}
@property(nonatomic,strong)UIView *otherKeyBoardView;

@end
