//
//  addYeWuViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "addYeWuViewController.h"

@interface addYeWuViewController ()

@end

@implementation addYeWuViewController
@synthesize dataDic;
@synthesize nowIndex;
@synthesize isZijI;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"业务员";
    
    
    NSArray *arr = [LUserDefault objectForKey:yewuKey];
    NSMutableArray *dataSource=[[NSMutableArray alloc]init];
    if (arr) {
        [dataSource addObjectsFromArray:arr];
    }else{
        [dataSource addObject:@{yeWuYuanName:@"业务员0号",yeWuYuanXingBie:@"男",yeWuYuanGongHao:@"001",yeWuYuanLianXi:@"15208107260",yeWuYuanYouJian:@"2225433460@qq.com"}];
    }
    

    if (isZijI==YES) {
        NSString *string = LUserInor(yeWuYuanGongHao);
        for (int i=0; i<dataSource.count; i++) {
            NSDictionary *dic=[dataSource objectAtIndex:i];
            ;
            if ([[dic validStringForKey:yeWuYuanGongHao]isEqualToString:string]) {
                dataDic=dic;
                nowIndex=i;
            }
        }
    }
    
    
    if (dataDic) {
        _xingBietf.text=[dataDic validStringForKey:yeWuYuanXingBie];
        _nametf.text=[dataDic validStringForKey:yeWuYuanName];
        _gonghaoTf.text=[dataDic validStringForKey:yeWuYuanGongHao];
        _lianxifangshiTf.text=[dataDic validStringForKey:yeWuYuanLianXi];
        _youjianTf.text=[dataDic validStringForKey:yeWuYuanYouJian];
        [self setNavRightButtonTitle:@"修改" selector:@selector(NavRightButtonClick)];

    }else{
        [self setNavRightButtonTitle:@"添加" selector:@selector(NavRightButtonClick)];

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)NavRightButtonClick{
    if ([_nametf.text isEqualToString:@""]||[_xingBietf.text isEqualToString:@""]||[_gonghaoTf.text isEqualToString:@""]||[_lianxifangshiTf.text isEqualToString:@""]||[_youjianTf.text isEqualToString:@""]) {
        KKShowNoticeMessage(@"请完善消息");
        return;
    }
    if (![_lianxifangshiTf.text isMobilePhoneNumber]) {
        KKShowNoticeMessage(@"请输入正确的电话号码");
        return;
    }
    if (![_youjianTf.text isEmail]) {
        KKShowNoticeMessage(@"请输入正确的邮件");
        return;
    }
    
    NSArray *arr = [LUserDefault objectForKey:yewuKey];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr) {
        [array addObjectsFromArray:arr];
    }
    
    if (dataDic) {
        [array replaceObjectAtIndex:nowIndex withObject:@{yeWuYuanName:_nametf.text,yeWuYuanXingBie:_xingBietf.text,yeWuYuanGongHao:_gonghaoTf.text,yeWuYuanLianXi:_lianxifangshiTf.text,yeWuYuanYouJian:_youjianTf.text}];
        KKShowNoticeMessage(@"修改成功");

    }else{
        [array addObject:@{yeWuYuanName:_nametf.text,yeWuYuanXingBie:_xingBietf.text,yeWuYuanGongHao:_gonghaoTf.text,yeWuYuanLianXi:_lianxifangshiTf.text,yeWuYuanYouJian:_youjianTf.text}];
        KKShowNoticeMessage(@"添加成功");

    }
    
    
    [LUserDefault setObject:array forKey:yewuKey];
    
    [self.navigationController popViewControllerAnimated:YES];
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
