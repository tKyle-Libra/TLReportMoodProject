//
//  TLImagePickerCell.m
//  TLReportMoodProject
//
//  Created by 同乐 on 16/1/27.
//  Copyright © 2016年 同乐. All rights reserved.
//

#import "TLImagePickerCell.h"
#import "AppMacro.h"

@interface TLImagePickerCell()

@property (strong , nonatomic) UIImageView *imageView;

@property (strong , nonatomic) UIButton *chooseButton;

@end

@implementation TLImagePickerCell


-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:_imageView];
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS)
    {
       _chooseButton = [[UIButton alloc] initWithFrame:CGRectMake(65, 5, 25, 25)];
    }
    else if (IS_IPHONE_6)
    {
        _chooseButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 5, 25, 25)];
    }
    else
    {
        _chooseButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 5, 25, 25)];
    }    
    
    [_chooseButton setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:0.5]];
    _chooseButton.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.3].CGColor;
    _chooseButton.layer.borderWidth = 1;
    _chooseButton.layer.masksToBounds = YES;
    _chooseButton.layer.cornerRadius = 12.5;
    [self addSubview:_chooseButton];
    
    return self;
}

-(void) setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
}


@end
