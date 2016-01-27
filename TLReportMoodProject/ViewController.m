//
//  ViewController.m
//  TLReportMoodProject
//
//  Created by 同乐 on 16/1/27.
//  Copyright © 2016年 同乐. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"

@interface ViewController ()

@property (strong , nonatomic) NSMutableArray *lists;

@end

@implementation ViewController

#define applicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

- (void)viewDidLoad {
    [super viewDidLoad];
    _lists = [NSMutableArray array];
    
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) GetAllPictures
{

    
}

@end
