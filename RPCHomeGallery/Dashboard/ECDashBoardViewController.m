//
//  ECDashBoardViewController.m
//  RPCHomeGallery
//
//  Created by Shunmugaraj on 11/11/13.
//  Copyright (c) 2013 ecsoftware.com. All rights reserved.
//

#import "ECDashBoardViewController.h"

#import "ECBookGalleryViewController.h"

@interface ECDashBoardViewController ()

@property (nonatomic, strong) ECBookGalleryViewController *bookGallery ;


@end

@implementation ECDashBoardViewController

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

    _bookGallery = [[ECBookGalleryViewController alloc] init];
    [self.view addSubview:_bookGallery.view];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [_bookGallery.bookGalleryView layoutSubviews];
    [_bookGallery.bookGalleryView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
