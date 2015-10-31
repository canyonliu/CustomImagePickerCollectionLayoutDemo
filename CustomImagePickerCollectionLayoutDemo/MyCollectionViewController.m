//
//  MyCollectionViewController.m
//  CustomImagePickerCollectionLayoutDemo
//
//  Created by WayneLiu on 15/10/31.
//  Copyright (c) 2015年 lqc. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "CustomTransformCollecionLayout.h"

@interface MyCollectionViewController ()<CustomTransformCollecionLayoutDelegate>

@property (nonatomic, strong) CustomTransformCollecionLayout *customeLayout;

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _customeLayout = (CustomTransformCollecionLayout *) self.collectionViewLayout;
    _customeLayout.layoutDelegate = self;
}



#pragma mark <CustomTransformCollecionLayoutDelegate>

- (CGSize)itemSizeWithCollectionView:(UICollectionView *)collectionView
                 collectionViewLayout:(CustomTransformCollecionLayout *)collectionViewLayout {
    return CGSizeMake(200, 200);
}

- (CGFloat)marginSizeWithCollectionView:(UICollectionView *)collectionView
                    collectionViewLayout:(CustomTransformCollecionLayout *)collectionViewLayout {
    return 10.0f;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSInteger imageIndex = indexPath.row % 4 +1;
    NSString *imageName = [NSString stringWithFormat:@"%ld", imageIndex];
    [cell.cellImageView setImage:[UIImage imageNamed:imageName]];
    
    __weak __block ImageCollectionViewCell * copy_cell = cell;
    [cell setTapButtonBlock:^{
        static int i = 0;
        if (i == 0) {
            [UIView animateWithDuration:0.5f animations:^{
                CGFloat scale = SCREEN_WIDTH/cell.frame.size.width;
                copy_cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale);
            }];
            
            i = 1;
            return;
        }
        
        if (i == 1) {
            [UIView animateWithDuration:0.5f animations:^{
                copy_cell.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0f,1.0f);
            }];
            
            i = 0;
            return;
        }
    }];

    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
