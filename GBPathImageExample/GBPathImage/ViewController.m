//
//  ViewController.m
//  GBPathImage
//
//  Created by Matteo Gobbi on 16/08/13.
//  Copyright (c) 2013 Matteo Gobbi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //You can easy init and add pathImage from code
    GBPathImageView *squareImage = [[GBPathImageView alloc] initWithFrame:CGRectMake(26, 117, 130, 130) image:[UIImage imageNamed:@"me.png"] pathType:GBPathImageViewTypeSquare pathColor:[UIColor orangeColor] borderColor:[UIColor redColor] pathWidth:6.0];
    [self.view addSubview:squareImage];
    
    
    //Or get from nib, set params (or leave default) and start the draw method
    GBPathImageView *img1 = (GBPathImageView *)[self.view viewWithTag:1];
    [img1 setPathColor:[UIColor yellowColor]];
    [img1 setBorderColor:[UIColor blackColor]];
    [img1 setPathWidth:6.0];
    [img1 setPathType:GBPathImageViewTypeCircle];
    [img1 draw];
    
    GBPathImageView *img2 = (GBPathImageView *)[self.view viewWithTag:2];
    [img2 setPathColor:[UIColor whiteColor]];
    [img2 setBorderColor:[UIColor darkGrayColor]];
    [img2 setPathWidth:4.5];
    [img2 setPathType:GBPathImageViewTypeCircle];
    [img2 draw];
    
    GBPathImageView *img3 = (GBPathImageView *)[self.view viewWithTag:3];
    [img3 setPathColor:[UIColor blackColor]];
    [img3 setBorderColor:[UIColor whiteColor]];
    [img3 setPathWidth:8.0];
    [img3 setPathType:GBPathImageViewTypeSquare];
    [img3 draw];
    
    GBPathImageView *img4 = (GBPathImageView *)[self.view viewWithTag:4];
    [img4 setPathColor:[UIColor redColor]];
    [img4 setBorderColor:[UIColor whiteColor]];
    [img4 setPathWidth:10.0];
    [img4 setPathType:GBPathImageViewTypeCircle];
    [img4 draw];
    
    GBPathImageView *img5 = (GBPathImageView *)[self.view viewWithTag:5];
    [img5 setPathColor:[UIColor whiteColor]];
    [img5 setBorderColor:[UIColor blackColor]];
    [img5 setPathWidth:5.0];
    [img5 setPathType:GBPathImageViewTypeSquare];
    [img5 draw];
    
    GBPathImageView *img6 = (GBPathImageView *)[self.view viewWithTag:6];
    [img6 setPathColor:[UIColor orangeColor]];
    [img6 setBorderColor:[UIColor whiteColor]];
    [img6 setPathWidth:4.0];
    [img6 setPathType:GBPathImageViewTypeCircle];
    [img6 draw];
}


@end
