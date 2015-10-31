//
//  ImageCollectionViewCell.h
//  CustomImagePickerCollectionLayoutDemo
//
//  Created by WayneLiu on 15/10/31.
//  Copyright (c) 2015年 lqc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapButtonBlock)();

@interface ImageCollectionViewCell : UICollectionViewCell


@property (strong, nonatomic) IBOutlet UIImageView *cellImageView;

- (void)setTapButtonBlock:(TapButtonBlock) block;

@end
