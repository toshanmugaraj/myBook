//
//  PSTCollectionViewFlowLayoutRTL.m
//  hana-iOS
//
//  Created by Shunmugaraj on 15/07/13.
//
//

#import "PSTCollectionViewFlowLayoutRTL.h"
//#import "ECTocSettings.h"
//#import "Settings.h"

@implementation PSTCollectionViewFlowLayoutRTL

-(void)setCurrentCellScale:(CGFloat)scale;
{
    _currentCellScale = scale;
    [self invalidateLayout];
}

- (void)setCurrentCellCenter:(CGPoint)origin
{
    _currentCellCenter = origin;
    [self invalidateLayout];
}

-(PSTCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Get the current attributes for the item at the indexPath
    
    PSTCollectionViewLayoutAttributes *attributes =
    [super layoutAttributesForItemAtIndexPath:indexPath];
    
    // Modify them to match the pinch values
    [self modifyLayoutAttributes:attributes];
    
    // return them to collection view
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    // Get all the attributes for the elements in the specified frame
    NSArray *allAttributesInRect = [super
                                    layoutAttributesForElementsInRect:rect];
    
    for (PSTCollectionViewLayoutAttributes *cellAttributes in allAttributesInRect)
    {
        // Modify the attributes for the cells in the frame rect
        [self modifyLayoutAttributes:cellAttributes];
    }
    return allAttributesInRect;
}

-(void)modifyLayoutAttributes:(PSTCollectionViewLayoutAttributes *)layoutAttributes
{
    // If the indexPath matches the one we have stored
    
    if (_isRTL) {
        layoutAttributes.frame = CGRectMake(_parentView.frame.size.width-layoutAttributes.frame.origin.x - layoutAttributes.frame.size.width, layoutAttributes.frame.origin.y, layoutAttributes.frame.size.width, layoutAttributes.frame.size.height);

    }
}

@end
