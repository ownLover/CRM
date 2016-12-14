//
//  chakanYIjianViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "chakanYIjianViewController.h"

@interface chakanYIjianViewController ()

@end

@implementation chakanYIjianViewController
@synthesize myTableView;
@synthesize information;
@synthesize dataSource;
@synthesize isFromYeWu;
@synthesize isFromLingDao;

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dataSource=[[NSMutableArray alloc]init];

    
    NSString *string = LUserInor(kehuName);
    
    NSArray *arr = [LUserDefault objectForKey:kehuKey];
    NSMutableArray * adataSource=[[NSMutableArray alloc]init];
    if (arr) {
        [adataSource addObjectsFromArray:arr];
    }
    
    if (isFromLingDao) {
        for (int i=0; i<adataSource.count; i++) {
            NSDictionary *dic=adataSource[i];
            if ([[dic objectForKey:kehuyijian] isNotEmptyArray]) {
                [dataSource addObjectsFromArray:[dic objectForKey:kehuyijian]];
            }
        }

    }else if(isFromYeWu){
        for (int i=0; i<adataSource.count; i++) {
            NSDictionary *dic=adataSource[i];
            if ([[dic objectForKey:kehuyijian] isNotEmptyArray]) {
                NSDictionary *dicc= [dic objectForKey:kehuDuiJieYeWuYuan];
               NSString *name = [dicc objectForKey:yeWuYuanName];
                if ([name isEqualToString:LUserInor(yeWuYuanName)]) {
                    [dataSource addObjectsFromArray:[dic objectForKey:kehuyijian]];
                }
            }
        }
        

    }else{
        for (int i=0; i<adataSource.count; i++) {
            NSDictionary *dic=adataSource[i];
            if ([[dic validStringForKey:kehuName]isEqualToString:string]) {
                [dataSource addObjectsFromArray:[dic objectForKey:kehuyijian]];
            }
        }

    }
    
    [myTableView reloadData];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ApplicationWidth, ApplicationHeight-44)];
    self.title=@"意见反馈";
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
//    @{kehudingdanShangPing:dataDic,kehudingdanshuliang:_tf1.text,kehudingdanshijian:_btn1.titleLabel.text}
    NSDictionary *dic=dataSource[indexPath.row];
    cell.textLabel.text=dic[@"name"];
    cell.detailTextLabel.text=dic[@"text"];
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
