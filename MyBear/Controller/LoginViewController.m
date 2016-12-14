//
//  LoginViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/8.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "LoginViewController.h"
#import "AViewController.h"
#import "kehujinlaiViewController.h"

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
- (IBAction)loginBtnClick:(id)sender {
    [LUserDefault setObject:_roleLab.text forKey:@"nowType"];
    
    if ([_nameTf.text isEqualToString:@""]||[_pwdTf.text isEqualToString:@""]) {
        KKShowNoticeMessage(@"填写用户名或密码");
        return;
    }

    if (![_pwdTf.text isEqualToString:@"123"]) {
        KKShowNoticeMessage(@"密码或账号不正确");
        return;
    }
    
    if ([_roleLab.text isEqualToString:@"领导"]) {
        
        if ([_nameTf.text isEqualToString:@"admin"]&&[_pwdTf.text isEqualToString:@"123"]) {
            
            lingDaoViewController *viewController = [[lingDaoViewController alloc]init];
            [self.navigationController pushViewController:viewController animated:YES];
            
        }else{
            KKShowNoticeMessage(@"账号或密码错误");
        }
    }
    if ([_roleLab.text isEqualToString:@"业务员"]) {
        [LUserDefault setObject:_nameTf.text forKey:yeWuYuanGongHao];
        
        
        
        NSArray *arr = [LUserDefault objectForKey:yewuKey];
      NSMutableArray *  dataSource=[[NSMutableArray alloc]init];
        if (arr) {
            [dataSource addObjectsFromArray:arr];
        }else{
            [dataSource addObject:@{yeWuYuanName:@"业务员0号",yeWuYuanXingBie:@"男",yeWuYuanGongHao:@"001",yeWuYuanLianXi:@"15208107260",yeWuYuanYouJian:@"2225433460@qq.com"}];
        }

        for (int  i=0; i<dataSource.count; i++) {
            NSDictionary *aaDic=dataSource[i];
            if ([[aaDic objectForKey:yeWuYuanGongHao] isEqualToString:_nameTf.text]) {
                [LUserDefault setObject:[aaDic objectForKey:yeWuYuanName] forKey:yeWuYuanName];

            }
            ;
        }
        
        
        AViewController *viewController = [[AViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    if ([_roleLab.text isEqualToString:@"客户"]) {
        [LUserDefault setObject:_nameTf.text forKey:kehuName];

        kehujinlaiViewController *viewController = [[kehujinlaiViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];

    }

    
    
    
    
    return;
    
    if ([_roleLab.text isEqualToString:@"领导"]) {

        if ([_nameTf.text isEqualToString:@"admin"]&&[_pwdTf.text isEqualToString:@"123"]) {
            
            lingDaoViewController *viewController = [[lingDaoViewController alloc]init];
            [self.navigationController pushViewController:viewController animated:YES];

        }else{
            KKShowNoticeMessage(@"账号或密码错误");
        }
    }
    if ([_roleLab.text isEqualToString:@"业务员"]) {
        AViewController *viewController = [[AViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];

    }
    if ([_roleLab.text isEqualToString:@"客户"]) {
        
    }
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
