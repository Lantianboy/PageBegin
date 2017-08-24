//
//  PageView.h
//  FirstImage
//
//  Created by 最爱是深蓝 on 2017/8/22.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView

+(PageView * )instance ;
- (instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr ;

@property (strong, nonatomic) IBOutlet UICollectionView * collection;
@property (strong, nonatomic) IBOutlet UIButton * btn;

@property (strong, nonatomic) IBOutlet UIPageControl * pageV;



@end
