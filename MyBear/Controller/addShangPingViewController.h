//
//  addShangPingViewController.h
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "BaseViewController.h"

@interface addShangPingViewController : BaseViewController<KKAlbumPickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *priceTf;
@property (weak, nonatomic) IBOutlet UITextField *numTf;
@property (weak, nonatomic) IBOutlet UITextField *shangXianTf;
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;

@end
