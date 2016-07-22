//
//  ViewController.m
//  动画练习
//
//  Created by 张策 on 16/7/22.
//  Copyright © 2016年 张策. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic,weak)UIView *aView;
@property (nonatomic,strong)  CALayer *dotLayer ;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds          = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius    = 10.0;
    replicatorLayer.position        =  self.view.center;
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    [self.view.layer addSublayer:replicatorLayer];
    
    
    //添加子点
    CALayer *dotLayer        = [CALayer layer];
    dotLayer.bounds          = CGRectMake(0, 0, 15, 15);
    dotLayer.position        = CGPointMake(15, replicatorLayer.frame.size.height/2 );
    dotLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    dotLayer.cornerRadius    = 7.5;
    _dotLayer = dotLayer;
    _dotLayer.transform = CATransform3DMakeScale(0, 0, 0);
    [replicatorLayer addSublayer:_dotLayer];
////直
//    replicatorLayer.instanceCount = 4;
//    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(replicatorLayer.frame.size.width/4, 0, 0);
//    replicatorLayer.instanceDelay = 1.0/4;
    
//圆
    CGFloat count                     =  10.0;
    replicatorLayer.instanceCount     = count;
    CGFloat angel                     = 2* M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    replicatorLayer.instanceDelay = 1.0/10;
}


/**
 *  位移
 */
- (void)moveToAnnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration    = 1.0;
    animation.fromValue   = @1;
    animation.toValue     = @0;
    animation.repeatCount = MAXFLOAT;
    [_dotLayer addAnimation:animation forKey:nil];
}

- (void)moveToKeypath
{
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREEN_WIDTH/2-100, SCREEN_HEIGHT/2-100, 200, 200)];
    anima.path = path.CGPath;
    anima.duration = 2.0f;
    [self.aView.layer addAnimation:anima forKey:@"pathAnimation"];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self moveToAnnimation];
//    [self moveToKeypath];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
