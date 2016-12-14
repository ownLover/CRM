//
//  kehudigndanViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/12/15.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface kehudigndanViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *myTableView;
@property(nonatomic,retain)NSMutableArray *dataSource;
@property(nonatomic,retain)NSMutableDictionary *information;

@property(nonatomic,assign)BOOL isFromYeWu;
@property(nonatomic,assign)BOOL isFromLingDao;

@end
