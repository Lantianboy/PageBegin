//
//  VCRoot.m
//  Page
//
//  Created by 最爱是深蓝 on 2017/8/29.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    
    
    UILabel * la =[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height/4, self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5)] ;
    la.text = @"主视图" ;
    la.textColor = [UIColor redColor] ;
    la.font = [UIFont systemFontOfSize:40] ;
    [self.view addSubview:la] ;
    
    // Do any additional setup after loading the view.
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
