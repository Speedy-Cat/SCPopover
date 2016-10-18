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

@end

@interface SCTablePopover : UIPopoverController <SCPopoverContentDelegate>

@property (nonatomic, weak) id<SCTablePopoverDelegate> delegate;

@property (nonatomic, strong) SCPopoverContentTableViewController *ccontentViewController;

-(id)initWithData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections;

@end
