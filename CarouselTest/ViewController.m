//
//  ViewController.m
//  CarouselTest
//
//  Created by lixun on 2016/12/12.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "ViewController.h"
#import "iCarousel.h"

@interface ViewController ()<iCarouselDataSource,iCarouselDelegate>

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ViewController{
    iCarousel *carousel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 250)];
    carousel.dataSource = self;
    carousel.delegate = self;
    carousel.type = iCarouselTypeRotary;
    [self.view addSubview:carousel];
    
    /*
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrolView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
     */
}


- (void)scrolView{
    [carousel scrollToItemAtIndex:1 animated:YES];
}
 
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    UIView *cardView = view;
    
    if ( !cardView )
    {
        cardView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 300, 200)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cardView.bounds];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.image = [UIImage imageNamed:@"test.jpg"];
        [cardView addSubview:imageView];

    }
    
    return cardView;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option) {
        case iCarouselOptionTilt:
            return 0.65;
            break;
        case iCarouselOptionSpacing:
            return 0.25;
        default:
            return value;
            break;
    }
}
@end
