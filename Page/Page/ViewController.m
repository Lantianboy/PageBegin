//
//  ViewController.m
//  Page
//
//  Created by 最爱是深蓝 on 2017/8/29.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "ViewController.h"
#import "PageView.h"

@interface ViewController ()

@property(nonatomic,strong)PageView * pageControl ;
@property(nonatomic,strong)NSArray * imageArr ;

@end

@implementation ViewController

-(NSArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [NSArray arrayWithObjects:@"杨1的副本.jpeg",@"杨2的副本.jpg",@"杨3的副本.jpeg",@"杨4的副本.jpeg",@"杨5的副本.jpeg",nil] ;
    }
    return _imageArr ;
}


-(PageView *) pageControl
{
    if (!_pageControl) {
        _pageControl = [[PageView instance]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andImageList:self.imageArr] ;
    }
    return _pageControl ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pageControl] ;
    
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
