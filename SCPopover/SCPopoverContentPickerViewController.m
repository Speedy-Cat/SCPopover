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
    [self.view addSubview:self.pickerView];
    
    // decided what to print in text view when init popover
    NSString *stringToPrint;
    if (self.selected.length) {
        stringToPrint = self.selected;
    }else if(self.tableData.count){
        stringToPrint = self.tableData[0];
    }
    self.textField.text = stringToPrint;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

-(UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
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
    return self.tableData.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.tableData[row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    self.textField.text = self.tableData[row];
}

-(void)selectRow {
    
    //select row
    if (self.selected && ![self.selected isEqualToString:@""]) {
        for (int i = 0; i < [self.tableData count]; i++) {
            NSString *item = self.tableData[i];
            if ([item isEqualToString:self.selected]) {
                [_pickerView selectRow:(NSInteger)i inComponent:0 animated:NO];
            }
        }
    }
}




@end