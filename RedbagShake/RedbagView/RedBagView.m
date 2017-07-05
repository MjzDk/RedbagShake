//
//  RedBagView.m
//  DKDemo-master
//
//  Created by 党凯 on 2017/6/28.
//  Copyright © 2017年 dangkai. All rights reserved.
//

#import "RedBagView.h"
#import "UIView+Shake.h"
@interface RedBagView()
@property (nonatomic,strong)UIImageView *aroundImageView;
@end
@implementation RedBagView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createRedBagViews];
    }
    return self;
}


-(void)createRedBagViews{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGPoint center = CGPointMake(width/2, height/2);
    //背景
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redbag_bg"]];
    bgImageView.frame = CGRectMake(0, 0, width/2, width/2);
    bgImageView.center = center;
    bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:bgImageView];
    //旋转
    _aroundImageView  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redbag_around"]];
    _aroundImageView.tag = 3;
    _aroundImageView.frame = CGRectMake(0, 0, width, width);
    _aroundImageView.center = center;
    _aroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3;
    rotationAnimation.repeatCount = HUGE_VALF;
    [_aroundImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [self addSubview:_aroundImageView];
    //红包
    UIImageView *redbagImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"find_redbag"]];
    redbagImageView.contentMode = UIViewContentModeScaleAspectFit;
    redbagImageView.frame = CGRectMake(0, 0, 60, 100);
    redbagImageView.center = center;
    //红包抖动
    [redbagImageView shakeWithOptions:SCShakeOptionsDirectionRotate | SCShakeOptionsForceInterpolationExpDown | SCShakeOptionsAtEndRestart force:0.2 duration:5 iterationDuration:0.2 completionHandler:nil];
    [self addSubview:redbagImageView];
}
+(instancetype)redBagView{
    return [[self alloc] init];
}
-(void)dealloc{
    //移除动画
    [_aroundImageView.layer removeAllAnimations];
}
@end
