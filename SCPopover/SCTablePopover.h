//
//  SCTablePopover.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPopoverContentTableViewController.h"

@interface SCTablePopover : UIPopoverController <SCPopoverContentDelegate>

-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField withSize:(CGSize)size withItemSelected:(NSString *)selected withSearchBar:(BOOL)isSearchBar;

@end
