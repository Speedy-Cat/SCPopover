//
//  SCTablePopover.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPopoverContentTableViewController.h"

@class SCTablePopover;

@protocol SCTablePopoverDelegate <UIPopoverControllerDelegate>

-(void)tablePopoverDidPressDoneButton:(SCTablePopover*)tablePopover;

-(void)tablePopover:(SCTablePopover*)tablePopover didSelectString:(NSString*)stringSelected;

@end

@interface SCTablePopover : UIPopoverController <SCPopoverTableContentDelegate>

@property (nonatomic, weak) id<SCTablePopoverDelegate> delegate;

@property (nonatomic, strong) SCPopoverContentTableViewController *contentTableViewController;

-(id)initWithData:(NSArray*)data
          forTargetView:(UIView*)targetView
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
        withButtonBar:(BOOL)isButtonBar
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections;

@end
