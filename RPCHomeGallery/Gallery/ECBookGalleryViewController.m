//
//  ECBookGalleryViewController.m
//  RPCHomeGallery
//
//  Created by Shunmugaraj on 11/11/13.
//  Copyright (c) 2013 ecsoftware.com. All rights reserved.
//

#import "ECBookGalleryViewController.h"
#import "PSTCollectionViewFlowLayoutRTL.h"
#import "PSTCollectionViewController.h"
#import "ECBookGalleryCell.h"

static NSString *cellIdentifier = @"ECBookCell";


@interface ECBookGalleryViewController () <PSTCollectionViewDataSource, PSTCollectionViewDelegate>

@end

@implementation ECBookGalleryViewController

#pragma mark Private Methods

-(void)layoutGallery {

    PSTCollectionViewFlowLayoutRTL *collectionViewFlowLayout = [[PSTCollectionViewFlowLayoutRTL alloc] init];

    [collectionViewFlowLayout setScrollDirection:PSTCollectionViewScrollDirectionHorizontal];
    CGRect rect = CGRectMake(0, 150,  self.view.bounds.size.width, 400);
    
    _bookGalleryView = [[PSTCollectionView alloc] initWithFrame:rect collectionViewLayout:collectionViewFlowLayout];
    [_bookGalleryView setAllowsSelection:YES];
    [_bookGalleryView setAllowsMultipleSelection:NO];
    [_bookGalleryView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [_bookGalleryView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    [self.view addSubview:_bookGalleryView];

    _bookGalleryView.dataSource = self;
    _bookGalleryView.delegate = self;
    
    [_bookGalleryView registerClass:[ECBookGalleryCell class] forCellWithReuseIdentifier:cellIdentifier];
//	[_bookGalleryView registerClass:[ECTOCHeaderView class] forSupplementaryViewOfKind:PSTCollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
//  [_bookGalleryView registerClass:[ECTOCHeaderView class] forSupplementaryViewOfKind:PSTCollectionElementKindSectionFooter withReuseIdentifier:footerViewIdentifier];
    
    collectionViewFlowLayout.parentView = _bookGalleryView;
    collectionViewFlowLayout = nil;
}


#pragma mark -

#pragma mark PSTCollectionView stuff


- (NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (PSTCollectionViewCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ECBookGalleryCell *cell = (ECBookGalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    
    return cell;
}

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize  cellSize = CGSizeMake(250, 340);
    return cellSize;
    
}
- (UIEdgeInsets)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets inset = {0,20,0,20};
    return inset;
}

- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 50;
}

- (CGFloat)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 50;
}

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    CGSize  cellSize = CGSizeMake(1, 40);
    return cellSize;
}


#pragma mark -
#pragma mark Collection View Delegate
- (NSString *)formatIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
}

- (void)collectionView:(PSTCollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(PSTCollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(PSTCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}




#pragma mark Controller Life Cycle

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    [self layoutGallery];
	// Do any additional setup after loading the view.
}



-(void)dealloc {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
