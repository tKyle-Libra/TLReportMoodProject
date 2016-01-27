//
//  TLImagePicker.m
//  TLReportMoodProject
//
//  Created by 同乐 on 16/1/27.
//  Copyright © 2016年 同乐. All rights reserved.
//

#import "TLImagePicker.h"
#import <Photos/Photos.h>
#import "TLImagePickerCell.h"
#import "AppMacro.h"
@interface TLImagePicker()

@property (strong , nonatomic) PHFetchResult *fetchResult;

@property (strong , nonatomic) PHFetchOptions *fetchOptions;

@property (strong , nonatomic) NSMutableArray *images;

@end



@implementation TLImagePicker

-(void) viewDidLoad
{
    [super viewDidLoad];
    _fetchOptions = [[PHFetchOptions alloc] init];
    _images = [NSMutableArray array];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[TLImagePickerCell class] forCellWithReuseIdentifier:NSStringFromClass([TLImagePickerCell class])];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_images removeAllObjects];

    [self GetAllPictures];
    self.navigationController.navigationBarHidden = NO;
}


-(void) GetAllPictures
{

    PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:_fetchOptions];
    if ([fetchResult countOfAssetsWithMediaType:PHAssetMediaTypeImage] == 0)
    {
        return;
    }
    _fetchResult = fetchResult;
    
    PHImageRequestOptions *requestOptions = [[PHImageRequestOptions alloc] init];
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;
    requestOptions.resizeMode = PHImageRequestOptionsResizeModeFast;
    
    [_fetchResult enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PHAsset *assert, NSUInteger idx, BOOL * _Nonnull stop)
    {
         [[PHImageManager defaultManager] requestImageForAsset:assert targetSize:[self ImageSize] contentMode:PHImageContentModeDefault options:requestOptions resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info)
         {
              [_images addObject:result];
              [self.collectionView reloadData];
         }];
    }];
}

-(CGSize) ImageSize
{
    if (IS_IPHONE_4_OR_LESS || IS_IPHONE_5)
    {
        return CGSizeMake(90, 90);
    }
    else if(IS_IPHONE_6)
    {
        return CGSizeMake(110, 110);
    }
    else
    {
        return CGSizeMake(120, 120);
    }
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_images count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLImagePickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TLImagePickerCell class]) forIndexPath:indexPath];
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLImagePickerCell *imageCell = (TLImagePickerCell *)cell;
    
    UIImage *image = [_images objectAtIndex:indexPath.row];
    
    imageCell.image = image;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self ImageSize];
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
}

@end
