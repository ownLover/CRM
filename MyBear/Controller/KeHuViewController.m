//
//  KeHuViewController.m
//  MyBear
//
//  Created by 林立祥 on 2016/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KeHuViewController.h"

@interface KeHuViewController ()

@end

@implementation KeHuViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"客户";
    
    dataSource=[[NSMutableArray alloc]init];
//    客户信息的数据（姓名、性别、职务、联系方式、邮件、对接业务员），订单状态跟踪（可根据订单状态检索，待签订、正在进行、已完成、已退回）
//    3、查看客户意见反馈

    
    [dataSource addObject:@"姓名"];
    [dataSource addObject:@"性别"];
    [dataSource addObject:@"职务"];
    [dataSource addObject:@"联系方式"];
    [dataSource addObject:@"邮件"];
    [dataSource addObject:@"对接业务员"];
    [dataSource addObject:@"订单状态跟踪"];
    [dataSource addObject:@"意见反馈"];
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
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = myBackgroundColor;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return <#expression#>;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, <#CGFloat height#>)];
//    headerView.backgroundColor = <##>;
//
//
//    return headerView;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return <#expression#>;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, <#CGFloat height#>)];
//    footerView.backgroundColor = <##>;
//
//
//    return footerView;
//
//}

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
