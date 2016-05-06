//
//  ViewController.m
//  KVBadge
//
//  Created by admin on 16/5/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KVBadge.h"
@interface ViewController ()
{
    NSInteger startNum;
}
@property (nonatomic,strong)UIView *testview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _testview = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 80, 40)];
    _testview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_testview];
    
    
    startNum=60;
    
    
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    addButton.backgroundColor = [UIColor redColor];
    [addButton addTarget:self action:@selector(addButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    
    UIButton *clearButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 40)];
    [clearButton addTarget:self action:@selector(clearButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    clearButton.backgroundColor =[UIColor greenColor];
    [self.view addSubview:clearButton];
    
}

-(void)addButtonClicked{
    [_testview showBadgeButtonWithNumber:startNum];
    startNum=startNum+20;
    if (startNum>150) {
        startNum=0;
    }
}

-(void)clearButtonClicked{
    [_testview clearBadge];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
