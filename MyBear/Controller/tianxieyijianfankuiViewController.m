//
//  tianxieyijianfankuiViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "tianxieyijianfankuiViewController.h"

@interface tianxieyijianfankuiViewController ()

@end

@implementation tianxieyijianfankuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavRightButtonTitle:@"提交" selector:@selector(NavRightButtonClick)];
    self.title=@"意见反馈";
    [_tf setBorderColor:[UIColor blackColor] width:1];
}

- (void)NavRightButtonClick{
    NSArray *arr=[LUserDefault objectForKey:kehuKey];
    NSMutableArray *bigArr=[[NSMutableArray alloc]initWithArray:arr];
    
    NSMutableDictionary *tDic=[[NSMutableDictionary alloc]init];;
    NSInteger index=0;
    for (int i=0; i<arr.count; i++) {
        NSDictionary *dic=arr[i];
        if ([LUserInor(kehuName) isEqualToString:[dic validStringForKey:kehuName]]) {
            tDic=[[NSMutableDictionary alloc]initWithDictionary:dic];;
            index=i;
        }
    }
    
    NSArray *arr1=[tDic objectForKey:kehuyijian];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr1) {
        [array addObjectsFromArray:arr1];
    }
    [array addObject:@{@"text":_tf.text,@"name":LUserInor(kehuName)}];
    [tDic setObject:array forKey:kehuyijian];
    [bigArr replaceObjectAtIndex:index withObject:tDic];
    [LUserDefault setObject:bigArr forKey:kehuKey];

    KKShowNoticeMessage(@"提交成功");
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
