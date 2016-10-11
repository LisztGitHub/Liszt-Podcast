//
//  PCMyHeadView.m
//  Podcast
//
//  Created by Lester on 16/9/29.
//  Copyright © 2016年 Liszt. All rights reserved.
//

#import "PCMyHeadView.h"
#import "UIImage+ImageEffects.h"

@interface PCMyHeadView()
/** 背景图 模糊*/
@property (strong, nonatomic) UIImageView *bgImageView;
/** 头像*/
@property (strong, nonatomic) UIImageView *headImageView;
/** detail BgView*/
@property (strong, nonatomic) UIView *detailBgView;
/** 昵称*/
@property (strong, nonatomic) UILabel *titleLabel;
/** 说明*/
@property (strong, nonatomic) UILabel *detailLabel;
/** 关注人数*/
@property (strong, nonatomic) UILabel *followLabel;
@end

@implementation PCMyHeadView

-(void)addSubview{
    [self addSubview:self.bgImageView];
    [self addSubview:self.detailBgView];
    [self addSubview:self.headImageView];
    [self.detailBgView addSubview:self.followLabel];
    [self.detailBgView addSubview:self.detailLabel];
    [self addSubview:self.titleLabel];
}
-(void)addSubviewLayout{
    self.bgImageView.sd_layout.leftEqualToView(self).rightEqualToView(self).topEqualToView(self).bottomEqualToView(self);
    self.headImageView.sd_layout.rightSpaceToView(self,-15).centerYEqualToView(self).widthIs(self.height * 0.3).heightIs(self.height * 0.3);
    self.detailBgView.sd_layout.leftEqualToView(self).rightEqualToView(self).bottomEqualToView(self).heightIs(self.height*0.3);
    self.titleLabel.sd_layout.leftSpaceToView(self,15).bottomSpaceToView(self.detailBgView,10).heightIs(17).rightSpaceToView(self.headImageView,10);
    self.followLabel.sd_layout.leftSpaceToView(self.detailBgView,15).rightSpaceToView(self.headImageView,10).heightIs(15).topSpaceToView(self.detailBgView,5);
    self.detailLabel.sd_layout.leftSpaceToView(self.detailBgView,15).rightSpaceToView(self.headImageView,10).bottomSpaceToView(self.detailBgView,5).topSpaceToView(self.followLabel,5);
}

#pragma mark - 懒加载
- (UIImageView *)bgImageView{
    if(!_bgImageView){
        _bgImageView = [UIImageView new];
        _bgImageView.image = [IMAGE_NAMED(@"Test_Head_image") applyBlurWithRadius:8.0 tintColor:RGBA(0, 0, 0, 0.05) saturationDeltaFactor:1.0 maskImage:nil];
        _bgImageView.clipsToBounds = YES;
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _bgImageView;
}
- (UIView *)detailBgView{
    if(!_detailBgView){
        _detailBgView = [UIView new];
        _detailBgView.backgroundColor = RGBA(240, 242, 245, 0.7);
    }
    return _detailBgView;
}
- (UIImageView *)headImageView{
    if(!_headImageView){
        _headImageView = [UIImageView new];
        _headImageView.image = IMAGE_NAMED(@"Test_Head_image");
        _headImageView.layer.cornerRadius = self.height * 0.3 / 2;
        _headImageView.layer.borderColor = [[UIColor whiteColor]CGColor];
        _headImageView.layer.borderWidth = 2;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}
- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [UILabel new];
        _titleLabel.font = MAIN_FONT(17.f);
        _titleLabel.text = @"Liszt";
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}
-(UILabel *)followLabel{
    if(!_followLabel){
        _followLabel = [UILabel new];
        _followLabel.font = MAIN_FONT(13.f);
        _followLabel.text = @"15,235 个关注者";
        _followLabel.textColor = [UIColor blackColor];
    }
    return _followLabel;
}
-(UILabel *)detailLabel{
    if(!_detailLabel){
        _detailLabel = [UILabel new];
        _detailLabel.font = MAIN_FONT(12.f);
        _detailLabel.text = @"It is really my honor to have this opportunity for an interview";
        _detailLabel.numberOfLines = 0;
        _detailLabel.textColor = [UIColor grayColor];
    }
    return _detailLabel;
}

@end
