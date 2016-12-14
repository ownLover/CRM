//
//  addKeHuViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "addKeHuViewController.h"

@interface addKeHuViewController ()

@end

@implementation addKeHuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"客户";
    [self setNavRightButtonTitle:@"添加" selector:@selector(NavRightButtonClick)];
}

- (void)NavRightButtonClick{
    if ([_nameTf.text isEqualToString:@""]||[_sexTf.text isEqualToString:@""]||[_zhiwuTf.text isEqualToString:@""]||[_lianxiTf.text isEqualToString:@""]||[_youjianTf.text isEqualToString:@""]) {
        KKShowNoticeMessage(@"请完善消息");
        return;
    }
    if (![_lianxiTf.text isMobilePhoneNumber]) {
        KKShowNoticeMessage(@"请输入正确的电话号码");
        return;
    }
    if (![_youjianTf.text isEmail]) {
        KKShowNoticeMessage(@"请输入正确的邮件");
        return;
    }

   NSArray *arr = [LUserDefault objectForKey:kehuKey];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr) {
        [array addObjectsFromArray:arr];
    }
    
    [array addObject:@{kehuName:_nameTf.text,kehuXingBie:_sexTf.text,kehuZhiWu:_zhiwuTf.text,kehuLianXi:_lianxiTf.text,kehuYouJian:_youjianTf.text}];
    
    [LUserDefault setObject:array forKey:kehuKey];
    
    KKShowNoticeMessage(@"添加成功");
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
