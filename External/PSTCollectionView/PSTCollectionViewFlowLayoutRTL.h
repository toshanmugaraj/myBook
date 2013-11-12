//
//  PSTCollectionViewFlowLayoutRTL.h
//  hana-iOS
//
//  Created by Shunmugaraj on 15/07/13.
//
//

#import "PSTCollectionViewFlowLayout.h"

@interface PSTCollectionViewFlowLayoutRTL : PSTCollectionViewFlowLayout

@property (strong, nonatomic) NSIndexPath *currentCellPath;
@property (nonatomic) CGPoint currentCellCenter;
@property (nonatomic) CGFloat currentCellScale;
//Converted to Weak after ARC
@property (nonatomic, weak) UIView *parentView;
@property (nonatomic) BOOL isRTL;


@end
