//
//  SCPopoverController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPickerPopover.h"


@implementation SCPickerPopover

-(id)initWithData:(NSArray*)data
          forTargetView:(UIView*)targetView
              withSize:(CGSize)size
      withItemSelected:(NSString *)selected
         withSearchBar:(BOOL)isSearchBar
{
    
    size = CGSizeMake(size.width, 216 + kBarHeight);//216px is the max height of picker view
    SCPopoverContentPickerViewController *contentViewController = [[SCPopoverContentPickerViewController new] initWithData:data forTargetView:targetView withSize:size withItemSelected:(selected)?@[selected]:@[] withSearchBar:isSearchBar maxSelections:(NSInteger*)1];
    
    self = [self initWithContentViewController:contentViewController];
    if (self) {
        contentViewController.delegate = self;
        self.popoverContentSize = size;
    }
    return self;
}

-(void)didContentEndEditing
{
    [self dismissPopoverAnimated:YES];
}

-(void)didPressDoneButton
{
    [self dismissPopoverAnimated:YES];
}


@end
