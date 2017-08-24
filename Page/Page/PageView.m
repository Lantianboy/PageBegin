//
//  PageView.m
//  FirstImage
//
//  Created by 最爱是深蓝 on 2017/8/22.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "PageView.h"
#import "CollectionCell.h"

#define kHighlighted [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]
#define kAfterDelayTime 0.3 //最后按钮显示的时间

static NSString * reuseIdentifier = @"CollectionCell" ;

@interface PageView()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>

@property (strong,nonatomic)NSArray * imageArr ;



@end
@implementation PageView

//类方法 加载xib
+(PageView *)instance
{
    NSArray * nibView = [[NSBundle mainBundle]loadNibNamed:@"PageView" owner:self options:nil] ;
    return [nibView objectAtIndex:0] ;
}


//初始化
-(instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr{
    self = [super initWithFrame:frame] ;
    if (self) {
        //设置默认值
        self.frame = frame ;
        self.backgroundColor = [UIColor brownColor] ;
        self.imageArr = arr ;
        
        [self setView] ;
    }
    return self ;
}

-(void) setView
{
    
    //self.collection = [[UICollectionView alloc]init] ;
    self.collection.frame = self.frame ;
    self.collection.dataSource = self ;
    self.collection.delegate = self ;
    
    //开启按页滚动
    self.collection.pagingEnabled = YES ;
    
    self.collection.contentSize= CGSizeMake(self.frame.size.width * self.imageArr.count, self.frame.size.height) ;
    
    //隐藏横向滚动条
    self.collection.showsVerticalScrollIndicator = NO ;
    
    //取消边缘弹簧效果
    self.collection.bounces = NO ;
    
    //隐藏纵向滚动条
    self.collection.showsHorizontalScrollIndicator = NO ;
    
   

    
    
    
    
    self.pageV = [[UIPageControl alloc]init] ;
    self.pageV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.1) ;
    self.pageV.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - self.pageV.frame.size.height/2) ;
    self.pageV.numberOfPages = self.imageArr.count ;//指定页面个数
    self.pageV.currentPage = 0 ; //指定pagecontroll的值 默认选中的小白点（第一个）
    self.pageV.pageIndicatorTintColor = [UIColor grayColor] ;
    //设置非选页的原点颜色
    //self.pageV.hidesForSinglePage = NO ;
    //不隐藏指示器
    self.pageV.currentPageIndicatorTintColor = [UIColor redColor] ;
    //设置选中的原点的颜色
    [self addSubview:self.pageV] ;
    
    
    
    
    
    //self.btn = [UIButton new] ;
    self.btn.frame = CGRectMake(0, 0, self.frame.size.width * 0.5,self.frame.size.height * 0.05) ;
    self.btn.center = CGPointMake(self.frame.size.width/2, self.pageV.frame.origin.y - self.btn.frame.size.height/2) ;
    self.btn.hidden = YES ;
    self.btn.backgroundColor = [UIColor clearColor] ;
    self.btn.layer.cornerRadius = 8.3 ;
    //self.btn.layer.masksToBounds = YES ;
    self.btn.layer.borderWidth = 1.0 ;
    self.btn.layer.borderColor = [UIColor whiteColor].CGColor ;
    //[_btn addTarget:self action:@selector(buttonBackColor:) forControlEvents:UIControlEventTouchDown] ;
    [_btn addTarget:self action:@selector(removeViewBtn:) forControlEvents:UIControlEventTouchUpInside] ;
    [_btn setTitle:@"进入应用" forState:UIControlStateNormal] ;
    
    
    
    
    
}


-(void)btnHidden:(UIButton *)btn
{
    btn.hidden = NO ;
}

-(void)buttonBackColor:(UIButton *)btn{
    btn.backgroundColor = kHighlighted ;
    
    
}

-(void)removeViewBtn:(UIButton *)btn
{
    btn.backgroundColor = [UIColor clearColor] ;
    [ self removeFromSuperview] ;
}


#pragma mark - UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1 ;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArr.count ;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    //加载nib文件
    UINib * nib = [UINib nibWithNibName:@"CollectionCellView" bundle:[NSBundle mainBundle]] ;
    
    //注册class 初始化创建cell
    //[self.collection registerClass:[CollectionCell class] forCellWithReuseIdentifier:reuseIdentifier] ;
    
    //注册cell 加载nib文件
    [self.collection registerNib:nib forCellWithReuseIdentifier:reuseIdentifier] ;
    
    //重用
    CollectionCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath] ;
    
    
    cell.imageV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) ;
    cell.imageV.image = [UIImage imageNamed:self.imageArr[indexPath.row]] ;
    
    
    return cell ;
}


//item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height) ;
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0) ;
    
}

// 两行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0 ;
}

// 两个cell之间的最小间距，是由API自动计算的，只有当间距小于该值时，cell会进行换行
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}



#pragma mark - UIScrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    //当scrollview偏移量等于最后一张图片位置时调用方法
    if ((scrollView.contentOffset.x/self.frame.size.width)==self.imageArr.count-1) {
        [self performSelector:@selector(btnHidden:) withObject:self.btn afterDelay:kAfterDelayTime] ;
    }else{
        self.btn.hidden = YES ;
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width ;
    self.pageV.currentPage = page ;
    
}









@end
