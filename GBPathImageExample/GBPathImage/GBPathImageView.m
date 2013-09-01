//
//  GBPathImageView.m
//  GBControls
//
//  Created by Matteo Gobbi on 15/08/13.
//  Copyright (c) 2013 Matteo Gobbi. All rights reserved.
//

#define LINE_BORDER_WIDTH 1.0

#import "GBPathImageView.h"

@interface GBPathImageView () {
    UIImage *originalImage;
}

@end


@implementation GBPathImageView

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        originalImage = image;
        
        [self setDefaultParam];
        
        [self draw];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
           pathType:(GBPathImageViewType)pathType
          pathColor:(UIColor *)pathColor
        borderColor:(UIColor *)borderColor
          pathWidth:(float)pathWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        originalImage = image;
        _pathType = pathType;
        _pathColor = pathColor;
        _borderColor = borderColor;
        _pathWidth = pathWidth;
         
        [self draw];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    originalImage = self.image;
    
    [self setDefaultParam];
    
    [self draw];
}


-(void)draw {
    
    CGRect rect;
    rect.size = self.frame.size;
    rect.origin = CGPointMake(0, 0);
    
    CGRect rectImage = rect;
    rectImage.origin.x += _pathWidth;
    rectImage.origin.y += _pathWidth;
    rectImage.size.width -= _pathWidth*2.0;
    rectImage.size.height -= _pathWidth*2.0;
    
    
    UIGraphicsBeginImageContextWithOptions(rect.size,0,0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextAddEllipseInRect(ctx, rect);
            break;
        case GBPathImageViewTypeSquare:
            CGContextAddRect(ctx, rect);
            break;
        default:
            break;
    }
    
    CGContextClip(ctx);
    [originalImage drawInRect:rectImage];
    
    
    
    //Add intern and extern line
    rectImage.origin.x -= LINE_BORDER_WIDTH/2.0;
    rectImage.origin.y -= LINE_BORDER_WIDTH/2.0;
    rectImage.size.width += LINE_BORDER_WIDTH;
    rectImage.size.height += LINE_BORDER_WIDTH;
    
    rect.origin.x += LINE_BORDER_WIDTH/2.0;
    rect.origin.y += LINE_BORDER_WIDTH/2.0;
    rect.size.width -= LINE_BORDER_WIDTH;
    rect.size.height -= LINE_BORDER_WIDTH;
    
    CGContextSetStrokeColorWithColor(ctx, [_borderColor CGColor]);
    CGContextSetLineWidth(ctx, LINE_BORDER_WIDTH);
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextStrokeEllipseInRect(ctx, rectImage);
            CGContextStrokeEllipseInRect(ctx, rect);
            break;
        case GBPathImageViewTypeSquare:
            CGContextStrokeRect(ctx, rectImage);
            CGContextStrokeRect(ctx, rect);
            break;
        default:
            break;
    }
    
    
    //Add center line
    float centerLineWidth = _pathWidth - LINE_BORDER_WIDTH*2.0;
    
    rectImage.origin.x -= LINE_BORDER_WIDTH/2.0+centerLineWidth/2.0;
    rectImage.origin.y -= LINE_BORDER_WIDTH/2.0+centerLineWidth/2.0;
    rectImage.size.width += LINE_BORDER_WIDTH+centerLineWidth;
    rectImage.size.height += LINE_BORDER_WIDTH+centerLineWidth;
    
    CGContextSetStrokeColorWithColor(ctx, [_pathColor CGColor]);
    CGContextSetLineWidth(ctx, centerLineWidth);
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextStrokeEllipseInRect(ctx, rectImage);
            break;
        case GBPathImageViewTypeSquare:
            CGContextStrokeRect(ctx, rectImage);
            break;
        default:
            break;
    }
    
    
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

-(void)setDefaultParam {
    _pathType = GBPathImageViewTypeCircle;
    _pathColor = [UIColor whiteColor];
    _borderColor = [UIColor darkGrayColor];
    _pathWidth = 5.0;
}


@end
