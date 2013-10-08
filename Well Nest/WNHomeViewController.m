//
//  WNHomeViewController.m
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "WNHomeViewController.h"

@interface WNHomeViewController ()

@end

@implementation WNHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor whiteColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Well Nest", @"");
    [label sizeToFit];
    
     [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"White_Image_Pattern.png"]]];
	// Do any additional setup after loading the view.
    
    [self.view addSubview:[self makeTabBarView:CGRectMake(0, 520, 320, 50)]];
    
    
    UIImage *laftButton = [UIImage imageNamed:@"signal"];
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setImage:laftButton forState:UIControlStateNormal];
    myButton.showsTouchWhenHighlighted = YES;
    myButton.frame = CGRectMake(0.0, 0.0, laftButton.size.width-20, laftButton.size.height-20);
    
    [myButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]
                           initWithCustomView:myButton];
    
    self.navigationItem.leftBarButtonItem = menuButton;
    
}


-(void)menuButtonClicked{
    NSLog(@"menuButtonClickedmenuButtonClicked");
}



- (UIView *)makeTabBarView:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar.png"]]];
    view.opaque = NO;
    
    UIImage *buttonImage;
    
    buttonImage = [UIImage imageNamed:@"music"];
    
    [self loginButtonForView:CGRectMake(30, 5, 45, 45) Text:@"" Image:buttonImage Tag:301 View:view];
    
    buttonImage = [UIImage imageNamed:@"phone"];
    
    [self loginButtonForView:CGRectMake(130, 5, 45, 45) Text:@"" Image:buttonImage Tag:301 View:view];
    
    buttonImage = [UIImage imageNamed:@"calender"];
    
    [self loginButtonForView:CGRectMake(230, 5, 45, 45) Text:@"" Image:buttonImage Tag:301 View:view];
    
    return view;
}

-(void)loginButtonForView:(CGRect)frame Text:(NSString *)buttonText Image:(UIImage *)image Tag:(int)tag View:(UIView*)view {
    ISButton *loginButton = [[ISButton alloc] initWithFrame:frame];
    loginButton.tag = tag;
    [loginButton setTitle:buttonText forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
    [loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:loginButton];
    //return loginButton;
}


-(IBAction)buttonPressed:(id)sender{
    
    if ([sender tag] == 301) {
        NSString *name = [[NSString alloc] initWithFormat:@"Relaxingsea_64kb"];
        NSString *source = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        if (data) {
            [data stop];
            data = nil;
        }
        data=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: source] error:NULL];
        data.delegate = self;
        [data play];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
