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

@implementation addKeHuViewController{
    NSDictionary *yeWuDic;
}
@synthesize dataDic;
@synthesize nowIndex;
@synthesize isFromKeHu;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"客户";
    
    if (isFromKeHu) {
        NSString *string = LUserInor(kehuName);
        
        NSArray *arr = [LUserDefault objectForKey:kehuKey];
        NSMutableArray * adataSource=[[NSMutableArray alloc]init];
        if (arr) {
            [adataSource addObjectsFromArray:arr];
        }

        
        for (int i=0; i<adataSource.count; i++) {
            NSDictionary *dic=adataSource[i];
            if ([[dic validStringForKey:kehuName]isEqualToString:string]) {
                dataDic=dic;
                nowIndex=i;
            }
        }
    }
    
    
    if (dataDic) {
        [self setNavRightButtonTitle:@"修改" selector:@selector(NavRightButtonClick)];
        
        _nameTf.text=[dataDic validStringForKey:kehuName];
        _sexTf.text=[dataDic validStringForKey:kehuXingBie];
        _zhiwuTf.text=[dataDic validStringForKey:kehuZhiWu];
        _lianxiTf.text=[dataDic validStringForKey:kehuLianXi];
        _youjianTf.text=[dataDic validStringForKey:kehuYouJian];
        yeWuDic=[dataDic objectForKey:kehuDuiJieYeWuYuan];
        
        [_duijieYewuyuanBtn setTitle:[yeWuDic objectForKey:yeWuYuanName] forState:UIControlStateNormal];
        [_dingDanzhuangtaiBtn setTitle:[dataDic objectForKey:kehuDingDanZhuangTai] forState:UIControlStateNormal];
    }else{
        
       yeWuDic = [self yewuyuan];
        [self setNavRightButtonTitle:@"添加" selector:@selector(NavRightButtonClick)];
        [_duijieYewuyuanBtn setTitle:[yeWuDic objectForKey:yeWuYuanName] forState:UIControlStateNormal];
        [_dingDanzhuangtaiBtn setTitle:@"待签订" forState:UIControlStateNormal];


    }
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
    
    
    
    
    if (dataDic) {
        [array replaceObjectAtIndex:nowIndex withObject:@{kehuName:_nameTf.text,kehuXingBie:_sexTf.text,kehuZhiWu:_zhiwuTf.text,kehuLianXi:_lianxiTf.text,kehuYouJian:_youjianTf.text,kehuDuiJieYeWuYuan:yeWuDic,kehuDingDanZhuangTai:_dingDanzhuangtaiBtn.titleLabel.text}];
        KKShowNoticeMessage(@"修改成功");

    }else{
        [array addObject:@{kehuName:_nameTf.text,kehuXingBie:_sexTf.text,kehuZhiWu:_zhiwuTf.text,kehuLianXi:_lianxiTf.text,kehuYouJian:_youjianTf.text,kehuDuiJieYeWuYuan:yeWuDic,kehuDingDanZhuangTai:_dingDanzhuangtaiBtn.titleLabel.text}];
        KKShowNoticeMessage(@"添加成功");

    }
    
    
    [LUserDefault setObject:array forKey:kehuKey];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (NSDictionary *)yewuyuan{
    NSArray *arr = [LUserDefault objectForKey:yewuKey];
   NSMutableArray *dataSource=[[NSMutableArray alloc]init];
    if (arr) {
        [dataSource addObjectsFromArray:arr];
    }else{
        [dataSource addObject:@{yeWuYuanName:@"业务员0号",yeWuYuanXingBie:@"男",yeWuYuanGongHao:@"001",yeWuYuanLianXi:@"15208107260",yeWuYuanYouJian:@"2225433460@qq.com"}];
    }
    
    NSInteger index=arc4random()%dataSource.count;
  return  [dataSource objectAtIndex:index];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dingdanzhuagntaiClick:(id)sender {
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"待签订",@"正在进行",@"已完成",@"已退回", nil];
    [sheet showInView:Window0];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",(long)buttonIndex);
    NSArray *arr=@[@"待签订",@"正在进行",@"已完成",@"已退回"];
    [_dingDanzhuangtaiBtn setTitle:[arr objectAtIndex:buttonIndex] forState:UIControlStateNormal];
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
