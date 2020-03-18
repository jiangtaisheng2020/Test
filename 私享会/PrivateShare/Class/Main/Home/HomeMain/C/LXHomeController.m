
#import "LXHomeController.h"

#import "SYPrivateOrderCollectionCell.h"
#import "SYRecentActivityCollectionCell.h"
#import "SYHotRecomendCollectionCell.h"
#import "SYHomeCollectionHeader.h"
#import "SYHomeCollectionTitleHeader.h"
#import "SYHomeBannerCollectionHeader.h"

#import "SYHomeLinkViewController.h"
#import "SYPrivateHouseKeeperViewController.h"

static NSString *kPrivateCollectionCell       = @"SYPrivateOrderCollectionCell";
static NSString *kRecentActivityCollectionCell  = @"SYRecentActivityCollectionCell";
static NSString *kHotRecomendCollectionViewCell      = @"SYHotRecomendCollectionCell";
static NSString *kHomeCollectionHeader       = @"LXHomeCollectionHeader";
static NSString *kHomeTitleCollectionHeader       = @"LXHomeTitleCollectionHeader";
static NSString *kHomeBannerCollectionHeader       = @"LXHomeBannerCollectionHeader";

static NSString *kHomeCollectionFooter       = @"LXHomeCollectionFooter";




@interface LXHomeController ()<UICollectionViewDelegate, UICollectionViewDataSource,SYHomeBannerDelegate,SYHotRecomDel>
{
    NSMutableArray * dataArray;
    NSMutableArray * titleArray;
}

@property (nonatomic, weak)   UICollectionView * collectionView;

@end

@implementation LXHomeController

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataArray = [[NSMutableArray alloc]init];
    titleArray = [[NSMutableArray alloc]init];
    [dataArray setArray:@[@[@{@"title":@"天下旅游",@"img":@"tianxialvyou_"},@{@"title":@"精彩生活",@"img":@"jingcaishenghuo_"},@{@"title":@"跨越领域",@"img":@"sigongyi_"},@{@"title":@"关爱公益",@"img":@"sigongyi_"}],@[@{@"title":@"活动",@"img":@"jinqihuodong_"}],@[@{@"title":@"新西兰",@"img":@"xinxilan_"},@{@"title":@"温都水城",@"img":@"wendushuicheng_"}],@[@{@"title":@"坝上草原",@"img":@"bashangcaoyuan_"},@{@"title":@"新西兰",@"img":@"xinxilanyinxiang_"}]]];
    [titleArray setArray:@[@{@"title":@"思享推荐"},@{@"title":@"近期活动"},@{@"title":@"热门推荐"},@{@"title":@"本周热门景点"}]];
    
    
    
    [self createUI];
    [self downloadData];
}

#pragma mark - Loading data

- (void)downloadData
{
 
}

#pragma mark - Create view

- (void)createUI
{
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc] init];
    flow.scrollDirection =UICollectionViewScrollDirectionVertical;
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kSCreenViewY, kScreenWidth, kScreenHeight - kSCreenViewY - 49) collectionViewLayout:flow];
    collection.bounces = YES;
    collection.backgroundColor = kCellBackGroundColor;
    collection.delegate = self;
    collection.dataSource = self;

    [collection registerClass:[SYPrivateOrderCollectionCell class] forCellWithReuseIdentifier:kPrivateCollectionCell];
    [collection registerClass:[SYRecentActivityCollectionCell class] forCellWithReuseIdentifier:kRecentActivityCollectionCell];
    [collection registerClass:[SYHotRecomendCollectionCell class] forCellWithReuseIdentifier:kHotRecomendCollectionViewCell];
    [collection registerClass:NSClassFromString(@"SYHomeCollectionHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHomeCollectionHeader];
    [collection registerClass:NSClassFromString(@"SYHomeCollectionTitleHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHomeTitleCollectionHeader];
    [collection registerClass:NSClassFromString(@"SYHomeBannerCollectionHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHomeBannerCollectionHeader];
    [collection registerClass:NSClassFromString(@"UICollectionReusableView") forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kHomeCollectionFooter];
    collection.backgroundColor = kBackGroundColor;
    [self.view addSubview:collection];
    self.collectionView = collection;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section)
    {
        case 0:
        {
            SYPrivateOrderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPrivateCollectionCell forIndexPath:indexPath];
            NSString * imgName = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"];
            cell.imageView.image = [UIImage imageNamed:imgName];
            cell.titleLable.text = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"title"];
            //            [cell configurationCell:self.dataArr[indexPath.row]];
            return cell;
        } break;
            
        case 1: {
            SYRecentActivityCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRecentActivityCollectionCell forIndexPath:indexPath];
            NSString * imgName = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"];
            cell.imgV.image = [UIImage imageNamed:imgName];
            cell.baseLable.text = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"title"];
            //            [cell configurationCell:self.dataArr[indexPath.row]];
            return cell;
        } break;
            case 2:
        {
            SYHotRecomendCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHotRecomendCollectionViewCell forIndexPath:indexPath];
            cell.hotDel = self;
//            [cell configurationCell:self.dataArr[indexPath.row]];
            [cell configurationCell:@""];

            return cell;
        }
            
        default: {
            
            SYPrivateOrderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPrivateCollectionCell forIndexPath:indexPath];
            NSString * imgName = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"];
            cell.imageView.image = [UIImage imageNamed:imgName];
            cell.titleLable.text = [[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"title"];
            //            [cell configurationCell:self.dataArr[indexPath.row]];
            return cell;
        } break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"00000%@",[[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"]);
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    //NSLog(@"00000%@",[[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"]);
                }
                    break;
                case 1:
                {
                    //NSLog(@"111111%@",[[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"]);
                }
                    break;
                case 2:
                {
                    //NSLog(@"222222%@",[[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"]);
                }
                    break;
                case 3:
                {
                    //NSLog(@"333333%@",[[dataArray[indexPath.section]objectAtIndex:indexPath.row]objectForKey:@"img"]);
                }
                    break;
                    
                default:
                    break;
            }
        } break;
            
        case 1: {
            
        } break;
        case 2:
        {
            
        }
            
        default: {
            
            
        } break;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 4;
    }
    else if (section == 1)
    {
        return 1;
    }
    else if (section == 2)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
//间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    switch (section)
    {
        case 0: {
            return UIEdgeInsetsMake(0, kScreenGap, 0, kScreenGap);
        } break;
            
        case 1: {
            return UIEdgeInsetsMake(0, 0, 0, 0);
        } break;
        case 2: {
            return UIEdgeInsetsMake(0, 0, 0, 0);
        } break;
            
        default: {
            return UIEdgeInsetsMake(10, kScreenGap, 15, 10);
        } break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: {
            CGFloat cellWidth = (kScreenWidth - kScreenGap*2 - 10)/2.0;
            return CGSizeMake(cellWidth, 123+10);
        } break;
            
        case 1: {
            CGFloat cellWidth = (kScreenWidth - kScreenGap*2);
            return CGSizeMake(cellWidth, 143);
        } break;
            
        case 2: {
            CGFloat cellWidth = kScreenWidth;
            return CGSizeMake(cellWidth, 10+87);
        } break;
            
        default: {
            CGFloat cellWidth = (kScreenWidth - kScreenGap*2 - 10)/2;
            return CGSizeMake(cellWidth, 123);
        } break;
    }
}

//最小横向间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0: {
            return 0;
        } break;
            
        case 1: {
            return 0;
        } break;
            
        case 2: {
            return 0;
        } break;
            
        default: {
            return 0;
        } break;
    }
}

//最小纵向间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    switch (section) {
        case 0: {
            return 0;
        } break;
            
        case 1: {
            return 0;
        } break;
            
        case 2: {
            return 0;
        } break;
            
        default: {
            return 0;
        } break;
    }
}

//设置标头和标尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        if (indexPath.section == 0)
        {
            SYHomeBannerCollectionHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeBannerCollectionHeader forIndexPath:indexPath];
            headerView.headerBottomLB.text = [titleArray[indexPath.section]objectForKey:@"title"];
            headerView.bannerDel = self;
            return headerView;
            
        }
        else if (indexPath.section == 1)
        {
            SYHomeCollectionTitleHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeTitleCollectionHeader forIndexPath:indexPath];
            headerView.headerBottomLB.text = [titleArray[indexPath.section]objectForKey:@"title"];
            return headerView;
            
        }
        else
        {
            SYHomeCollectionHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeCollectionHeader forIndexPath:indexPath];
            headerView.headerBottomLB.text = [titleArray[indexPath.section]objectForKey:@"title"];
            return headerView;
        }
        
    } else
    {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeCollectionFooter forIndexPath:indexPath];
        footerView.backgroundColor = kBackGroundColor;
        return footerView;
        return nil;
//        if (indexPath.section == 0 || indexPath.section == 1)
//        {
//            UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeCollectionFooter forIndexPath:indexPath];
//            footerView.backgroundColor = kLineColor;
//            return footerView;
//            return nil;
//        }
//        else
//        {
//            UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHomeCollectionFooter forIndexPath:indexPath];
//            footerView.backgroundColor = kBackGroundColor;
//            return footerView;
//        }
        
    }
}

//设置镖头的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(kScreenWidth, 160+100+46+48);
    }
    return CGSizeMake(kScreenWidth, 44);
}

//设置彪尾的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(kScreenWidth, 0);
    }
    
    return CGSizeMake(kScreenWidth, 15);
}


#pragma mark - SystemDelegate



#pragma mark - CustomDelegate
-(void)didTapAD:(int)adNum
{
    //点击广告
    DeLog(@"广告:%d",adNum);
}

-(void)didTapButton:(int)btNum
{
    //点击按钮
    DeLog(@"按钮:%d",btNum);
#pragma 需要修改请求
    
    switch (btNum)
    {
        case 20:
        {
            //结伴旅行
            SYHomeLinkViewController * homeLink = [[SYHomeLinkViewController alloc]init];
            homeLink.type = btNum-20;
            homeLink.titleName = @"结伴出行";
            homeLink.orgID = @"110020";
            [self.navigationController pushViewController:homeLink animated:YES];
        }
            break;
        case 21:
        {
            SYHomeLinkViewController * homeLink = [[SYHomeLinkViewController alloc]init];
            homeLink.type = btNum-20;
            //精彩游记
            homeLink.titleName = @"定制旅游";
            homeLink.orgID = @"110020";
            [self.navigationController pushViewController:homeLink animated:YES];
            homeLink.orgID = @"110020";
        }
            break;
        case 22:
        {
            SYHomeLinkViewController * homeLink = [[SYHomeLinkViewController alloc]init];
            homeLink.type = btNum-20;
            //旅行攻略
            homeLink.titleName = @"景点推荐";
            homeLink.orgID = @"110020";
            [self.navigationController pushViewController:homeLink animated:YES];
            
            
        }
            break;
        case 23:
        {
            //私人管家
            SYPrivateHouseKeeperViewController * ph = [[SYPrivateHouseKeeperViewController alloc]init];
            ph.titleName = @"私人管家";
            [self.navigationController pushViewController:ph animated:YES];
        }
            break;
            
        default:
            break;
    }
    
    
}

//点击热门推荐
-(void)tapHotNum:(int)num
{
    DeLog(@"%d",num);
}


-(void)didTapSearch:(NSString *)searchText searchCity:(NSString *)searchCity
{
    DeLog(@"搜索内容:%@++++++搜索城市:%@",searchText,searchCity);
}

-(void)didTapPhone:(NSString *)phoneNum
{
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"您将要拨打电话" message:phoneNum preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"拨打" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNum]]];
    }];
    
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
    
    DeLog(@"电话号码:%@",phoneNum);
}

#pragma mark - Observer



#pragma mark - Event response



#pragma mark - Private methods



#pragma mark - Setter and getter

@end
