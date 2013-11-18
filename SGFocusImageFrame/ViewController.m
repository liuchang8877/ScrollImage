//
//  ViewController.m
//  SGFocusImageFrame
//
//  Created by Shane Gao on 17/6/12.
//  Copyright (c) 2012 Shane Gao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)setupViews;
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Demo";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self viewDidLayoutSubviews];
    [self setupViews];
}

//ios7位置调整
- (void) viewDidLayoutSubviews {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        CGRect viewBounds = self.view.bounds;
        CGFloat topBarOffset = self.topLayoutGuide.length;
        viewBounds.origin.y = topBarOffset * -1;
        self.view.bounds = viewBounds;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


#pragma mark - 
- (void)setupViews
{
    SGFocusImageItem *item1 = [[[SGFocusImageItem alloc] initWithTitle:@"1" image:[UIImage imageNamed:@"banner1"] tag:0] autorelease];
    SGFocusImageItem *item2 = [[[SGFocusImageItem alloc] initWithTitle:@"2" image:[UIImage imageNamed:@"banner2"] tag:1] autorelease];
    SGFocusImageItem *item3 = [[[SGFocusImageItem alloc] initWithTitle:@"3" image:[UIImage imageNamed:@"banner3"] tag:2] autorelease];
    SGFocusImageItem *item4 = [[[SGFocusImageItem alloc] initWithTitle:@"4" image:[UIImage imageNamed:@"banner4"] tag:4] autorelease];
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 180.0)
                                                                    delegate:self
                                                             focusImageItems:item1, item2, item3, item4, nil];
    [self.view addSubview:imageFrame];
    
    [imageFrame release];
}

#pragma mark -
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    NSLog(@"%@ tapped", item.title);
}
@end
