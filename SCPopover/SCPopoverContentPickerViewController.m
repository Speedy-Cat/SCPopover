//
//  SCPopoverPickerViewController.m
//  SCPopover
//
//  Created by Adrian Ortuzar on 28/06/15.
//  Copyright (c) 2015 Adrian Ortuzar. All rights reserved.
//

#import "SCPopoverContentPickerViewController.h"

@interface SCPopoverContentPickerViewController ()

@property (strong, nonatomic) UIPickerView *pickerView;

@end

@implementation SCPopoverContentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // add the picker
    [self.view addSubview:self.pickerView];
    
    // print selected string
    if ([self.targetView isKindOfClass:[UITextField class]]) {
        ((UITextField*)self.targetView).text = ^NSString*(){
            NSString *stringToPrint;
            if (self.selected.count && 	((NSString*)self.selected[0]).length) {
                stringToPrint = (NSString*)self.selected[0];
            }
            return stringToPrint;
        }();
    }
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

-(UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kBarHeight, self.size.width, self.size.height)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        [self selectRow];
    }
    return _pickerView;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.data.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.data[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (self.data.count) {
        //self.textField.text = self.tableData[row];
    }
}

-(void)selectRow {
    
    //select row
    NSString *selectedString = (self.selected.count)?(NSString*)self.selected[0]:nil;
    if (selectedString && ![selectedString isEqualToString:@""]) {
        for (int i = 0; i < [self.data count]; i++) {
            NSString *item = self.data[i];
            if ([item isEqualToString:selectedString]) {
                [_pickerView selectRow:(NSInteger)i inComponent:0 animated:NO];
            }
        }
    }
}

#pragma mark - SCPopoverBarDelegate

-(void)didPressDoneButton
{
    int selectedRow = (int)[self.pickerView selectedRowInComponent:0];
    if (self.data.count) {
        if ([self.targetView isKindOfClass:[UITextField class]]) {
            ((UITextField*)self.targetView).text = self.data[selectedRow];
        }
    }
    
    [super didPressDoneButton];
}

-(void)didPressCancelButton
{
    [super didPressCancelButton];
}

@end
