//
//  addShangPingViewController.m
//  MyBear
//
//  Created by 紫平方 on 16/12/14.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "addShangPingViewController.h"

@interface addShangPingViewController ()

@end

@implementation addShangPingViewController{
    NSString *tempImgPath;
}

- (void)NavRightButtonClick{
    if ([_nameTf.text isEqualToString:@""]||[_priceTf.text isEqualToString:@""]||[_numTf.text isEqualToString:@""]||[_shangXianTf.text isEqualToString:@""]||!tempImgPath) {
        KKShowNoticeMessage(@"请完善消息");
        return;
    }
    
    NSArray *arr = [LUserDefault objectForKey:shangPingKey];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    if (arr) {
        [array addObjectsFromArray:arr];
    }
    
    [array addObject:@{shangPingName:_nameTf.text,shangPingJiaGe:_priceTf.text,shangPingNum:_numTf.text,shangPingShangXiang:_shangXianTf.text,shangPingImg:tempImgPath}];
    
    [LUserDefault setObject:array forKey:shangPingKey];
    
    KKShowNoticeMessage(@"添加成功");
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavRightButtonTitle:@"添加" selector:@selector(NavRightButtonClick)];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)imgClick:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"拍照"
                                  otherButtonTitles:@"相册",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag=3000;
    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag==3000) {
        if (buttonIndex == 0) {
            UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.allowsEditing = YES;
            imagePickerController.delegate = self;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
        else if (buttonIndex == 1) {
            NSLog(@"1");
            KKAlbumPickerController * viewController = [[KKAlbumPickerController alloc]
                                                        initWithDelegate:self
                                                        numberNeedSelected:1
                                                        editEnable:YES
                                                        cropSize:CGSizeMake(200, 200)
                                                        pushToDefaultDirectory:YES];
            
            [self presentViewController:viewController animated:YES completion:^{
            }];
        }
    }
}

#pragma mark ==================================================
#pragma mark == KKAlbumPickerControllerDelegate【图片】
#pragma mark ==================================================
- (void)KKAlbumPickerController_DidFinishedPickImage:(NSArray*)aImageArray imageInformation:(NSArray*)aImageInformationAray
{
    if ([aImageArray count]>0) {
        [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
        
        [NSData convertImage:aImageArray toDataSize:200 convertImageOneCompleted:^(NSData *imageData, NSInteger index) {
            
            
            
            NSString *path = [NSString stringWithFormat:@"%@/Documents/PublishFinanceImage_header%@.jpg", NSHomeDirectory(),[NSDate getStringFromDate:[NSDate date] dateFormatter:KKDateFormatter01]];
            tempImgPath=path;
            BOOL result = [imageData writeToFile:path atomically:YES];
            if (result) {
                [_imgBtn setImage:[[UIImage alloc]initWithContentsOfFile:tempImgPath] forState:UIControlStateNormal];

            }
        } KKImageConvertImageAllCompletedBlock:^{
            [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
        }];
    }
}


#pragma mark ========================================
#pragma mark ==UIImagePickerController
#pragma mark ========================================
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSArray *arr=[NSArray arrayWithObjects:image, nil];
    [NSData convertImage:arr toDataSize:200 convertImageOneCompleted:^(NSData *imageData, NSInteger index) {
        NSString *path = [NSString stringWithFormat:@"%@/Documents/PublishFinanceImage_header%@.jpg", NSHomeDirectory(),[NSDate getStringFromDate:[NSDate date] dateFormatter:KKDateFormatter01]];
        tempImgPath=path;
        
        BOOL result = [imageData writeToFile:path atomically:YES];
        if (result) {
            ;
            [_imgBtn setImage:[[UIImage alloc]initWithContentsOfFile:tempImgPath] forState:UIControlStateNormal];
            
        }
        
    } KKImageConvertImageAllCompletedBlock:^{
        [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] windows] objectAtIndex:0] animated:YES];
    }];
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
