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
    
    // add bar
    UIView *bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kBarHeight)];
    int buttonWidth = 70;
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, CGRectGetHeight(bar.frame))];
    UIColor *defaultcolor = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:1];
    UIColor *highlightedColor = [UIColor colorWithRed:0 green:122.0/255 blue:255.0/255 alpha:0.5];
    [cancelButton setTitle:@"cancel" forState:UIControlStateNormal];
    [cancelButton setTitleColor:defaultcolor forState:UIControlStateNormal];
    [cancelButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [cancelButton addTarget:self
                   action:@selector(pressCancelButton:)
         forControlEvents:UIControlEventTouchUpInside];
    
    //
    UIButton *doneButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(bar.frame) - buttonWidth, 0, buttonWidth, CGRectGetHeight(bar.frame))];
    [doneButton setTitle:@"done" forState:UIControlStateNormal];
    [doneButton addTarget:self
                   action:@selector(pressDoneButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [doneButton setTitleColor:defaultcolor forState:UIControlStateNormal];
    [doneButton setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    
    //
    [bar addSubview:cancelButton];
    [bar addSubview:doneButton];
    
    [self.view addSubview:bar];
    
    // decided what to print in text view when init popover
    NSString *stringToPrint;
    if (self.selected.length) {
        stringToPrint = self.selected;
    }else if(self.tableData.count){
        stringToPrint = self.tableData[0];
    }
    self.textField.text = stringToPrint;
}

-(void)pressDoneButton:(id)sender
{
    int selectedRow = [self.pickerView selectedRowInComponent:0];
    if (self.tableData.count) {
        self.textField.text = self.tableData[selectedRow];
    }
    
    // close popover
    if([self.delegate respondsToSelector:@selector(didContentEndEditing)]){
        [self.delegate didContentEndEditing];
    }
}

-(void)pressCancelButton:(id)sender
{
    // close popover
    if([self.delegate respondsToSelector:@selector(didContentEndEditing)]){
        [self.delegate didContentEndEditing];
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
    if (self.tableData.count) {
        //self.textField.text = self.tableData[row];
    }
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
