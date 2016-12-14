//
//  yeWulistViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface yeWulistViewController : BaseViewController
<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *myTableView;
@property(nonatomic,retain)NSMutableArray *dataSource;
@property(nonatomic,retain)NSMutableDictionary *information;
@end
