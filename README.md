# SCPopover

Libary to implement selectors inside a popover.
This library is providing a picker view or a table view inside a a popover.
You can use the SCPickerPopover or SCTablePopover class to build a popover related with a text field. This text field will be automatically populate each time that the popover select a item.


```
CGSize size = CGSizeMake(200, 0);// height is fixed to 216
NSArray *genderArray = @[@"Male", @"Female"];
NSString *selected = @"Female";
        
SCPickerPopover *popover = [[SCPickerPopover alloc] initWithTableData:genderArray forTextField:textField withSize:size withItemSelected:selected];
[popover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
```

