//
//  ViewController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 24/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "ViewController.h"
#import "SCPickerPopover.h"
#import "SCTablePopover.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *countries;
@property (weak, nonatomic) IBOutlet UITextField *tablePopoverTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *jsonString = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:jsonString encoding:NSUTF8StringEncoding error:NULL];
    NSData *objectData = [myJSON dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:objectData
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    self.countries = jsonArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == self.tablePopoverTextField) {
        CGSize size = CGSizeMake(350, 600);
        SCTablePopover *popover = [[SCTablePopover alloc] initWithTableData:self.countries forTextField:textField withSize:size];
        [popover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }else{
        CGSize size = CGSizeMake(200, 0);// height is fixed to 216
        NSArray *genderArray = @[@"Male", @"Female"];
        SCPickerPopover *popover = [[SCPickerPopover alloc] initWithTableData:genderArray forTextField:textField withSize:size];
        [popover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }

    
    return NO;
}

@end
