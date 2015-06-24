//
//  PopoverContentViewController.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverContentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField;

@end
