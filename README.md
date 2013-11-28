GBPathImageView
===============

With this class, you can get images in the circles or squares with the border.

![GBPathImageView screenshot](https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/1663/Schermata_2013-08-16_alle_01.34.51.png "GBPathImageView Screenshot")

## Example Usage

This is an easy example to init the control from code:

``` objective-c
    GBPathImageView *squareImage = [[GBPathImageView alloc] initWithFrame:CGRectMake(26, 117, 130, 130) image:[UIImage imageNamed:@"me.png"] pathType:GBPathImageViewTypeSquare pathColor:[UIColor orangeColor] borderColor:[UIColor redColor] pathWidth:6.0];
    [self.view addSubview:squareImage];
```

Or get from nib, set params (or leave default) and start the draw method

``` objective-c
    GBPathImageView *img1 = (GBPathImageView *)[self.view viewWithTag:1];
    [img1 setPathColor:[UIColor yellowColor]];
    [img1 setBorderColor:[UIColor blackColor]];
    [img1 setPathWidth:6.0];
    [img1 setPathType:GBPathImageViewTypeCircle];
    [img1 draw];
```

See the example's project.


## Contact

Matteo Gobbi

- http://www.matteogobbi.it
- http://github.com/matteogobbi
- http://twitter.com/matteo_gobbi
- https://angel.co/matteo-gobbi
- http://www.linkedin.com/profile/view?id=24211474

## License

GBPathImageView is available under the MIT license.
