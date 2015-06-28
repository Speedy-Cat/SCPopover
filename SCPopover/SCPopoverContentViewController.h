//
//  SCPopoverContentViewController.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCPopoverContentViewController : UIViewController

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) UITextField *textField;
@property (nonatomic) CGSize size;
-(id)initWithTableData:(NSArray*)data forTextField:(UITextField*)textField withSize:(CGSize)size;

@end
