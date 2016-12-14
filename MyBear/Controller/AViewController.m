//
//  1ViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "AViewController.h"
#import "addYeWuViewController.h"
#import "shangPingListViewController.h"
#import "KeHuListViewController.h"
@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"业务员";
    [self setNavRightButtonTitle:@"注销" selector:@selector(zhuxiao)];

    [self setNavLeftButtonTitle:@"" selector:@selector(kong)];
    

}

- (IBAction)gerenxinxi:(id)sender {
    addYeWuViewController *viewController = [[addYeWuViewController alloc]init];
    viewController.isZijI=YES;
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)wdkehu:(id)sender {
    
    KeHuListViewController *viewController = [[KeHuListViewController alloc]init];
    viewController.isChaKan=YES;
    [self.navigationController pushViewController:viewController animated:YES];

    
}

- (IBAction)sp:(id)sender {
    shangPingListViewController *viewController = [[shangPingListViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)yjfk:(id)sender {
    chakanYIjianViewController *viewController = [[chakanYIjianViewController alloc]init];
    viewController.isFromYeWu=YES;
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
