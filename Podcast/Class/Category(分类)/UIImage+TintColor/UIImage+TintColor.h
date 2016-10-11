//
//  UIImage+TintColor.h
//  Podcast
//
//  Created by Lester on 16/10/8.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TintColor)
-(UIImage*)tintedImageWithColor:(UIColor*)color;
-(UIImage*)tintedImageWithColor:(UIColor*)color level:(CGFloat)level;
-(UIImage*)tintedImageWithColor:(UIColor*)color rect:(CGRect)rect;
-(UIImage*)tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level;
-(UIImage*)tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets;
-(UIImage*)intedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets level:(CGFloat)level;

-(UIImage*)lightenWithLevel:(CGFloat)level;
-(UIImage*)lightenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)lightenRect:(CGRect)rect withLevel:(CGFloat)level;

-(UIImage*)darkenWithLevel:(CGFloat)level;
-(UIImage*)darkenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)darkenRect:(CGRect)rect withLevel:(CGFloat)level;

//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
