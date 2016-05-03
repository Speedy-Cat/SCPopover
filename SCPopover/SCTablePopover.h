//
//  SCTablePopover.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPopoverContentTableViewController.h"

@protocol SCTablePopoverDelegate <UIPopoverControllerDelegate>

-(void)didPressDoneButton;

@end

@interface SCTablePopover : UIPopoverController <SCPopoverContentDelegate>

@property (nonatomic, assign) id<SCTablePopoverDelegate> delegate;

@property (nonatomic, strong) SCPopoverContentTableViewController *ccontentViewController;

-(id)initWithData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSArray *)selected
         withSearchBar:(BOOL)isSearchBar
         maxSelections:(NSInteger*)maxSelections;

@end
