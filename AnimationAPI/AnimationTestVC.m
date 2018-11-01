//
//  AnimationTestVC.m
//  AnimationAPI
//
//  Created by fengpan on 2018/9/6.
//  Copyright © 2018年 fengpan. All rights reserved.
//

#import "AnimationTestVC.h"

@interface AnimationTestVC ()
@property (weak, nonatomic) IBOutlet UIView *myAnimationView;

@end

@implementation AnimationTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    //    typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
    //
    //        // 1.常规动画属性设置（可以同时选择多个进行设置）
    //        UIViewAnimationOptionLayoutSubviews            = 1 <<  0,//动画过程中保证子视图跟随运动。即提交UIView动画时，自动更新Subview的Layout约束
    //        UIViewAnimationOptionAllowUserInteraction      = 1 <<  1,//动画过程中允许用户交互，比如触摸
    //        UIViewAnimationOptionBeginFromCurrentState     = 1 <<  2, //所有视图从当前状态开始运行
    //        UIViewAnimationOptionRepeat                    = 1 <<  3,//动画无限重复
    //        UIViewAnimationOptionAutoreverse               = 1 <<  4, //动画运行到结束点后仍然以动画方式回到初始点。**执行动画回路,前提是设置动画无限重复**
    //        UIViewAnimationOptionOverrideInheritedDuration = 1 <<  5, //忽略嵌套动画时间设置。**忽略外层动画嵌套的时间变化曲线**
    //        UIViewAnimationOptionOverrideInheritedCurve    = 1 <<  6, //忽略嵌套动画速度设置。**通过改变属性和重绘实现动画效果，如果key没有提交动画将使用快照**
    //        UIViewAnimationOptionAllowAnimatedContent      = 1 <<  7,//动画过程中重绘视图（注意仅仅适用于转场动画）。
    //        UIViewAnimationOptionShowHideTransitionViews   = 1 <<  8, //视图切换时直接隐藏旧视图、显示新视图，而不是将旧视图从父视图移除（仅仅适用于转场动画）**用显隐的方式替代添加移除图层的动画效果**
    //        UIViewAnimationOptionOverrideInheritedOptions  = 1 <<  9,//不继承父动画设置或动画类型。**忽略嵌套继承的option选项**
    //
    //        //2.动画速度控制（可从其中选择一个设置）时间函数曲线相关**时间曲线函数**
    //        UIViewAnimationOptionCurveEaseInOut            = 0 << 16,//动画先缓慢，然后逐渐加速，**默认**
    //        UIViewAnimationOptionCurveEaseIn               = 1 << 16,//动画逐渐变慢
    //        UIViewAnimationOptionCurveEaseOut              = 2 << 16,//动画逐渐加速
    //        UIViewAnimationOptionCurveLinear               = 3 << 16,//动画匀速执行，默认值
    //
    //        //3.转场类型（仅适用于转场动画设置，可以从中选择一个进行设置，基本动画、关键帧动画不需要设置）**转场动画相关的**
    //        //[UIView transitionFromView: toView: duration: options:  completion:^(****BOOL****finished) {}];
    //        // 该方法效果是插入一面视图移除一面视图，期间可以使用一些转场动画效果。
    //        UIViewAnimationOptionTransitionNone            = 0 << 20,//没有转场动画效果**默认**
    //        UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,//从左侧翻转效果
    //        UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,//从右侧翻转效果
    //        UIViewAnimationOptionTransitionCurlUp          = 3 << 20,//向后翻页的动画过渡效果
    //        UIViewAnimationOptionTransitionCurlDown        = 4 << 20,//向前翻页的动画过渡效果
    //        UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,//旧视图溶解消失显示下一个新视图的效果
    //        UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,//从上方翻转效果
    //        UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,//底部翻转效果。
    //
    //        //4、帧率控制
    //        UIViewAnimationOptionPreferredFramesPerSecondDefault     = 0 << 24,//默认的帧每秒.
    //        UIViewAnimationOptionPreferredFramesPerSecond60          = 3 << 24,//60帧每秒的帧速率
    //        UIViewAnimationOptionPreferredFramesPerSecond30          = 7 << 24,//30帧每秒的帧速率
    //    } ;
    //
    if (!self.myAnimationView) {
        UIView *bgView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        bgView.center = self.view.center;
        [self.view addSubview:bgView];
        self.myAnimationView = bgView;
        
        /**创建一个动画
         *UIView普通动画各参数介绍
         *@duration:动画时长
         *@delay:动画延迟
         *@dampingRatio:动画阻尼 如果为1动画则平稳减速动画没有振荡。 这里值为 0~1
         *@velocity动画速率。数值越小，动力越小，弹簧的拉伸幅度就越小度 像素/秒
         *@options:动画效果枚举
         *
         *回调一:动画结束后,视图的状态
         *回调二:动画执行完毕
         */
        // https://www.jianshu.com/p/ba01dc76be7e
        [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            NSLog(@"-------");
            self.myAnimationView.backgroundColor = [UIColor redColor];
            self.myAnimationView.frame = CGRectMake(0.1*self.view.frame.size.width, 0.1*(self.view.frame.size.height-64)+64, 0.8*self.view.frame.size.width, 0.8*(self.view.frame.size.height-64));
            
        } completion:^(BOOL finished) {
            NSLog(@"创建完成");
        }];
    }else{
        [UIView performSystemAnimation:UISystemAnimationDelete onViews:@[self.myAnimationView] options:UIViewAnimationOptionLayoutSubviews animations:^{
            NSLog(@"--------");
        } completion:^(BOOL finished) {
            NSLog(@"销毁结束");
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
