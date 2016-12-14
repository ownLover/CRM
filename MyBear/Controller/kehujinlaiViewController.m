//
//  kehujinlaiViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "kehujinlaiViewController.h"
#import "shangPingListViewController.h"
#import "tianxieyijianfankuiViewController.h"
#import "addKeHuViewController.h"
#import "chakanYIjianViewController.h"
#import "kehudigndanViewController.h"

@interface kehujinlaiViewController ()

@end

@implementation kehujinlaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavRightButtonTitle:@"注销" selector:@selector(zhuxiao)];
    [self setNavLeftButtonTitle:@"" selector:@selector(kong)];
self.title=@"客户";
}
- (IBAction)gerenxinxi:(id)sender {
    addKeHuViewController *viewController = [[addKeHuViewController alloc]init];
    viewController.isFromKeHu=YES;
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)shagnping:(id)sender {
    shangPingListViewController *viewController = [[shangPingListViewController alloc]init];
    viewController.isFromKehu=YES;
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)dingdan:(id)sender {
    kehudigndanViewController *viewController = [[kehudigndanViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)fk:(id)sender {
    tianxieyijianfankuiViewController *viewController = [[tianxieyijianfankuiViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

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
