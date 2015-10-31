//
//  ImageCollectionViewCell.m
//  CustomImagePickerCollectionLayoutDemo
//
//  Created by WayneLiu on 15/10/31.
//  Copyright (c) 2015年 lqc. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@interface ImageCollectionViewCell ()

@property (nonatomic, strong) TapButtonBlock block;

@end

@implementation ImageCollectionViewCell

-(void) setTapButtonBlock: (TapButtonBlock) block {
    if (block) {
        _block = block;
    }
}
- (IBAction)tapCellButton:(id)sender {
    if (_block) {
        _block();
    }
}

@end
