//
//  UIImage+ImageEffects.h
//  Podcast
//
//  Created by Lester on 16/9/29.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)
-(UIImage*)applyLightEffect;

-(UIImage*)applyExtraLightEffect;

-(UIImage*)applyDarkEffect;

-(UIImage*)applyTintEffectWithColor:(UIColor*)tintColor;

-(UIImage*)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor*)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage*)maskImage;
@end
