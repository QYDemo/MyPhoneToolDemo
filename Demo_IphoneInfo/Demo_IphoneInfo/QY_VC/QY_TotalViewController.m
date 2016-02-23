//
//  QY_TotalViewController.m
//  Demo_IphoneInfo
//
//  Created by ihefe－hulinhua on 2/19/16.
//  Copyright © 2016 ihefe_hlh. All rights reserved.
//

#import "QY_TotalViewController.h"

@interface topViw : UIView

@property (nonatomic ,strong)UILabel *titleLabel;

@end

@implementation topViw
@synthesize  titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:40.f/255.f green:50.f/255.f blue:57.f/255.f alpha:1];
        
        titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.mas_equalTo(13);
            
            // 设置当前视图的大小
            make.size.mas_equalTo(CGSizeMake(100, 40));

        }];
        
        
    }
    return self;
    
}



@end


#pragma mark ------------------------------------------------------------------------------

@interface QY__InformationButton : UIButton



@end

@implementation QY__InformationButton


- (id)initWithFrame:(CGRect)frame withButtonName:(NSString *)btnStr
{
    self = [super initWithFrame:frame];
    if (self) {


    }

    return self;
}

- (id)initWithBtnStr:(NSString *)btnStr
{
    self = [super init];

    if (self) {
        self.backgroundColor = [UIColor colorWithRed:54.f/255.f green:56.f/255.f blue:73.f/255.f alpha:.8];
        [self setTitle:btnStr forState:normal];
        self.layer.cornerRadius = 25.f;

        self.layer.borderWidth = 1.f;
        self.layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.5f].CGColor;
    }
    return self;
}


@end
#pragma mark ------------------------------------------------------------------------------

@interface QY_TotalViewController ()
{
    topViw *top;
}

@end

@implementation QY_TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = VC_Color;
    top = [[topViw alloc] init];
    [self.view addSubview:top];
    
    [top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(0.f);
        make.left.equalTo(self.view).with.offset(0.f);
        make.right.equalTo(self.view).with.offset(0.f);
        make.height.mas_equalTo(60.f);
    }];
    
    QY__InformationButton *btn = [[QY__InformationButton alloc] initWithBtnStr:_informationBtnStr];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(250.f, 50.f));
        make.bottom.equalTo(self.view).with.offset(-130.f);
        make.centerX.equalTo(self.view);
    }];
    
    [btn addTarget:self action:@selector(touchInfomationBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setTitleStr:(NSString *)titleStr
{
    top.titleLabel.text = titleStr;
}

- (void)touchInfomationBtn:(UIButton *)btn
{
    
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
