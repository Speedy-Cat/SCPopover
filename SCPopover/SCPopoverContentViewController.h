//
//  SCPopoverContentViewController.h
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBarHeight 40

@interface SCPopoverContentViewController : UIViewController

@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) NSString *selected;
@property (nonatomic) CGSize size;

-(id)initWithTableData:(NSArray*)data
          forTextField:(UITextField*)textField
              withSize:(CGSize)size
      withItemSelected:(NSString*)selected;

@end
