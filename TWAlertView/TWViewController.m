//
//  TWViewController.m
//  TWAlertView
//
//  Created by Joey on 13-5-14.
//  Copyright (c) 2013年 Towords. All rights reserved.
//

#import "TWViewController.h"
#import "TWAlertView.h"

@interface TWViewController ()

@end

@implementation TWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressed:(id)sender {
    [TWAlertView showAlert:@"title" message:@"Hello" cancelButtonTitle:@"取消" cancelBlock:^{
        [TWAlertView showAlert:nil message:@"You pressed Cancel" cancelButtonTitle:@"知道了" cancelBlock:nil];
    } otherButtonTitles:@"确定" otherBlock:^{
        [TWAlertView showAlert:nil message:@"You pressed OK" cancelButtonTitle:@"知道了" cancelBlock:nil otherButtonTitles:nil otherBlock:nil];
    }];
}

@end
