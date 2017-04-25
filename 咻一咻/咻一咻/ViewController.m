
#import "ViewController.h"

@interface ViewController ()
//把支付宝控件全局化
@property(nonatomic,weak)UIButton *zfbBtn;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图片21	21	36
    self.view.backgroundColor=[UIColor colorWithRed:21/255.0 green:21/255.0 blue:36/255.0 alpha:1];
    
    //创建支付宝控件
    UIButton *zfbBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    //添加图片
    [zfbBtn setImage:[UIImage imageNamed:@"alipay_msp_op_success"] forState:UIControlStateNormal];
    //设置大小与位置
    //自动适配大小
    [zfbBtn sizeToFit];
    //位置是视图的中心
    zfbBtn.center=self.view.center;
    
    
    //把控件添加到视图上
    [self.view addSubview:zfbBtn];
    //把支付宝控件全局化
    _zfbBtn=zfbBtn;
    //监听控件的方法
    [zfbBtn addTarget:self action:@selector(startXiuXiu) forControlEvents:UIControlEventTouchUpInside];
}


-(void)startXiuXiu
{
    for (NSInteger i=0; i<10; i++) {
        
        
        //创建视图控件
        UIView *circleView=[[UIView alloc]init];
        //设置视图控件的背景颜色 0	170	238
        circleView.backgroundColor=[UIColor colorWithRed:0 green:170/255.0 blue:238/255.0 alpha:1];
        //设置位置和大小
        circleView.frame=_zfbBtn.frame;
        //把视图控件插入到支付宝控件下
        [self.view insertSubview:circleView belowSubview:_zfbBtn];
        //修剪边角
        circleView.layer.cornerRadius=circleView.bounds.size.width*0.5;
        //超出边界裁剪掉
        circleView.layer.masksToBounds=YES;
        
        [UIView animateWithDuration:2.0 delay:i*0.2 options:0 animations:^{
            //放大
            circleView.transform=CGAffineTransformMakeScale(17, 17);
            
            //慢慢透明
            circleView.alpha=0;
        } completion:^(BOOL finished) {
            //动画执行完成之后把看不到的view移除
            [circleView removeFromSuperview];
        }];
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
