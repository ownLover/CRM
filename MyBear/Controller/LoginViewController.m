//
//  LoginViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/8.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn1:(id)sender {
    UIButton *btn=sender;
    _roleLab.text=btn.titleLabel.text;;
}
- (IBAction)btn2:(id)sender {
    UIButton *btn=sender;
    _roleLab.text=btn.titleLabel.text;;

}
- (IBAction)btn3:(id)sender {
    UIButton *btn=sender;
    _roleLab.text=btn.titleLabel.text;;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
