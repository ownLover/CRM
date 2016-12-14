//
//  lingDaoViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "lingDaoViewController.h"
#import "yeWulistViewController.h"
#import "KeHuListViewController.h"
#import "shangPingListViewController.h"

@interface lingDaoViewController ()

@end

@implementation lingDaoViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;

- (void)kong{

}

- (void)zhuxiao{
    UINavigationController *nav=[[UINavigationController alloc]init];
    LoginViewController *viewController = [[LoginViewController alloc]init];
    nav.viewControllers=@[viewController];
    [UIApplication sharedApplication].keyWindow.rootViewController=nav;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setNavLeftButtonTitle:@"" selector:@selector(kong)];
    
    [self setNavLeftButtonTitle:@"领导" selector:@selector(kong)];

    [self setNavRightButtonTitle:@"注销" selector:@selector(zhuxiao)];
    
    self.title=@"CRM";
    dataSource=[[NSMutableArray alloc]init];
    [dataSource addObject:@"业务员"];
    [dataSource addObject:@"客户"];
    [dataSource addObject:@"商品"];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight-44)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //myTableView.estimatedRowHeight = 1000;
    
    //myTableView.rowHeight = UITableViewAutomaticDimension;
    
    [myTableView setTableFooterView:[[UIView alloc]init]];
    
    [self.view addSubview:myTableView];

}

#pragma mark ========================================
#pragma mark ==UITableView
#pragma mark ========================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier01=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier01];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier01];
    }
    cell.textLabel.text=dataSource[indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        [self NavLeftButtonClick];
    }
    if (indexPath.row==1) {
        [self NavRightButtonClick];
    }
    if (indexPath.row==2) {
        shangPingListViewController *viewController = [[shangPingListViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//    }
//}


- (void)NavLeftButtonClick{
    yeWulistViewController *viewController = [[yeWulistViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

}

- (void)NavRightButtonClick{
    KeHuListViewController *viewController = [[KeHuListViewController alloc]init];
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
