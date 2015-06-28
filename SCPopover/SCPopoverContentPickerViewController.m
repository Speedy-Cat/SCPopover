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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
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




@end
