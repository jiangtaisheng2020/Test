//
//  SYMyInfoViewController.m
//  PrivateShare
//
//  Created by bean on 16/9/20.
//  Copyright © 2016年 xunbao. All rights reserved.
//

#define Notification2 @"MyInformationViewController2"//上传头像给铁哥

#import "SYMyInfoViewController.h"
#import "SYMyInfoTableView.h"
#import "SYMyNickNameViewController.h"//昵称
#import "SYMySexViewController.h"//性别
#import "SYMySignViewController.h"//个性签名
#import "SYProvinceViewController.h"//地区

#import "PhotoTweaksViewController.h"//裁剪头像
#import "SYUpdateImg.h"
#import "LXNavigationController.h"
@interface SYMyInfoViewController ()<SYMyInfoDelegate,ZYQAssetPickerControllerDelegate,PhotoTweaksViewControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray * dataArr;
    UIImage * croppedImg;
    SYMyInfoTableView * infoView;
}

@end

@implementation SYMyInfoViewController

#pragma mark - Life cycle

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self creatDateAndRefresh];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getTieAva:) name:Notification2 object:nil];
    
    self.titleStr = @"个人信息";
    [self leftImageNormalStr:@"go_back_on" withAction:@selector(back)];
}
-(void)creatDateAndRefresh
{
    dataArr = [[NSMutableArray alloc]init];
    
    NSData * avatar = [[NSUserDefaults standardUserDefaults]objectForKey:kUDAvatarImgData];
    if (avatar == nil || avatar.length==0)
    {
        UIImage * img = [UIImage imageNamed:@"head"];
        avatar = UIImageJPEGRepresentation(img, 0.5);
    }
    NSArray * arr = @[@{@"title":@"头像",@"detail":avatar}];
    [dataArr addObject:arr];
    
    
    NSString * nickName = [[NSUserDefaults standardUserDefaults]objectForKey:kUDNickname];
    NSString * sex = [[NSUserDefaults standardUserDefaults]objectForKey:kUDSex];
    //如果没有昵称
    if (nickName == nil || [nickName isEqualToString:@""])
    {
        nickName = @"私享汇";
    }
    NSArray * arr2 = @[@{@"title":@"昵称",@"detail":nickName},@{@"title":@"性别",@"detail":sex}];
    [dataArr addObject:arr2];
    
    NSString * sign = [[NSUserDefaults standardUserDefaults]objectForKey:kUDSignature];
//    NSString * area = [[NSUserDefaults standardUserDefaults]objectForKey:kUDProvince];
//    DeLog(@"%@",area);
    NSArray * arr3 = @[@{@"title":@"个性签名",@"detail":sign},@{@"title":@"地区",@"detail":@""}];
    [dataArr addObject:arr3];
    
    if (infoView==nil)
    {
        infoView = [[SYMyInfoTableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-44) style:UITableViewStyleGrouped];
        infoView.myInfoDel = self;
        [infoView loadData:dataArr];
        [self.view addSubview:infoView];
    }else
    {
        [infoView loadData:dataArr];
    }
}
#pragma mark - CustomDelegate
-(void)didSelectIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    //头像
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self gotoUpDataAva];
                    });
                }
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    //昵称
                    SYMyNickNameViewController * nickName = [[SYMyNickNameViewController alloc]init];
                    nickName.oldName = [[dataArr[indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"detail"];
                    [self.navigationController pushViewController:nickName animated:YES];
                }
                    break;
                case 1:
                {
                    //性别
                    SYMySexViewController * sex = [[SYMySexViewController alloc]init];
                    sex.mysex = [[dataArr[indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"detail"];
                    [self.navigationController pushViewController:sex animated:YES];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    //个性签名
                    SYMySignViewController * sign = [[SYMySignViewController alloc]init];
                    sign.oldSign = [[dataArr[indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"detail"];
                    [self.navigationController pushViewController:sign animated:YES];
                }
                    break;
                case 1:
                {
                    //地区
                    SYProvinceViewController * area = [[SYProvinceViewController alloc]init];
                    LXNavigationController * nav = [[LXNavigationController alloc]initWithRootViewController:area];
                    nav.navigationBarHidden = YES;
//                    [self.navigationController pushViewController:area animated:YES];
                    [self presentViewController:nav animated:YES completion:nil];
                }
                    break;
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - Private methods
#pragma mark 上传头像
-(void)gotoUpDataAva
{
    
    ZYQAssetPickerController *picker =[[ZYQAssetPickerController alloc] init];
    
    picker.delegate=self;
    
    [SYUpdateImg setNav:picker Num:1 setObj:@"1"];
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (assets.count == 0)
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"未选中图片。" message:@"" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert show];
                
            }
            else
            {
                ALAsset *asset=assets[0];
                UIImage *tempImg=[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
                
                PhotoTweaksViewController *photoTweaksViewController = [[PhotoTweaksViewController alloc] initWithImage:tempImg];
                
                photoTweaksViewController.delegate = self;
                //是否要将截取的头像保存到手机相册，YES是保存
                photoTweaksViewController.autoSaveToLibray = NO;
                
                [self.navigationController pushViewController:photoTweaksViewController animated:YES];
                
            }
            
        });
        
        
    });
    
}

#pragma mark 头像上传的代理方法
- (void)photoTweaksController:(PhotoTweaksViewController *)controller didFinishWithCroppedImage:(UIImage *)croppedImage
{
    
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    [arr addObject:croppedImage];
    NSString * path = [NSString stringWithFormat:@"%@%@%@",kSXHUploadPath,kSXHImgUploadath,kSXHImgUpload];
    [SYUpdateImg postImgArr:arr postUrl:path notification:Notification2];
    
}

//用户取消上传
- (void)photoTweaksControllerDidCancel:(PhotoTweaksViewController *)controller
{
    //取消上传
    [self.navigationController popViewControllerAnimated:YES];
}


//上传裁剪后头像
-(void)upDataAvatarHpptBody:(NSDictionary*)HpptBody
{
    self.HUD.label.text = @"上传中";
    [self.view addSubview:self.HUD];
    [self.HUD showAnimated:YES];
    
    NSString *urlAsString=[NSString stringWithFormat:@"%@%@%@",kSXHXLSPath,kSXHUserPath,kSXHUserAvatar];
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:HpptBody];
    [LXNetRequest putWithUrlString:urlAsString withParam:dic success:^(NSDictionary *responseObject)
     {
         int status = [responseObject[@"status"]intValue];
         
         if (status == 2000)
         {
             [self hudHideTextStr:@"上传成功" delayTime:2.0];
             
             [[NSUserDefaults standardUserDefaults]setObject:UIImageJPEGRepresentation(croppedImg, 0.5) forKey:kUDAvatarImgData];
             //上传成功
             NSData * avatar = [[NSUserDefaults standardUserDefaults]objectForKey:kUDAvatarImgData];
             NSArray * arr = @[@{@"title":@"头像",@"detail":avatar}];
             [dataArr replaceObjectAtIndex:0 withObject:arr];
             [infoView loadData:dataArr];
             
         }
         else
         {
             [self hudHideTextStr:@"上传失败" delayTime:2.0];
         }
         
         
     } failure:^(NSError *error)
     {
         [self hudHideTextStr:@"失败，请检查网络" delayTime:2.0];
     }];
    
}


//上传头像给铁哥返回
-(void)getTieAva:(NSNotification*)info
{
    id responseObject = info.object;
    
    if ([responseObject isKindOfClass:[NSError class]])
    {
        [self hudHideTextStr:@"上传失败" delayTime:2.0];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSDictionary * dic = responseObject;
        int status = [dic[@"result"]intValue];
        if (status == 200)
        {
            NSDictionary * imgAvaDic = dic[@"imgArr"];
            NSString * imgAva = imgAvaDic[@"0"];
            NSDictionary * body= @{@"avatar":imgAva};
            NSArray * ava = dic[@"selectImg"];
            croppedImg = ava[0];
            [self upDataAvatarHpptBody:body];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else
        {
            [self hudHideTextStr:@"上传失败" delayTime:2.0];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:Notification2 object:nil];
}



@end
