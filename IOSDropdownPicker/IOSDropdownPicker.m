//
//  IOSDropdownPicker.m
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import "IOSDropdownPicker.h"

@implementation IOSDropdownPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    dropdownPickerView = [[UIView alloc] initWithFrame:CGRectMake(0, screenRect.size.height, screenRect.size.width, 224)];
    [self.superview addSubview:dropdownPickerView];
    
    pickerViewToolbar = [[UIToolbar alloc] init];
    pickerViewToolbar.frame = CGRectMake(0, 0, screenRect.size.width, 44);
    pickerViewToolbar.barStyle = UIBarStyleBlackOpaque;
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerviewDoneTapped:)]];
    [pickerViewToolbar setItems:items animated:NO];
    [dropdownPickerView addSubview:pickerViewToolbar];

    pickerView = [[UIPickerView alloc] init];
    pickerView.frame = CGRectMake(0, pickerViewToolbar.frame.size.height, screenRect.size.width, dropdownPickerView.frame.size.height);
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [dropdownPickerView addSubview:pickerView];
    
    dropdownButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [dropdownButton addTarget:self
                       action:@selector(dropdownButtonTapped:)
             forControlEvents:UIControlEventTouchUpInside];
    [dropdownButton setTitle:@"Show View" forState:UIControlStateNormal];
    dropdownButton.frame = rect;
    [self addSubview:dropdownButton];
}

- (void)pickerviewDoneTapped:(id)sender
{
    [self removeDropdownPickerView];
}

- (void)dropdownButtonTapped:(id)sender
{
    [self showProfilePickerView];
}

- (void)showProfilePickerView
{
    [pickerView selectRow:0 inComponent:0 animated:FALSE];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    dropdownPickerView.frame = CGRectMake(0, screenRect.size.height - (dropdownPickerView.frame.size.height + 50), dropdownPickerView.frame.size.width, dropdownPickerView.frame.size.height);
    [UIView commitAnimations];
}

- (void)removeDropdownPickerView
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    dropdownPickerView.frame = CGRectMake(0, screenRect.size.height, dropdownPickerView.frame.size.width, dropdownPickerView.frame.size.height);
    [UIView commitAnimations];
}

#pragma mark Forwared UIPickerViewDelegate Methods

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.delegate pickerView:thePickerView titleForRow:row forComponent:component];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.delegate pickerView:thePickerView didSelectRow:row inComponent:component];
}

#pragma mark Forwared UIPickerViewDataSource Delegate Methods

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dataSource pickerView:thePickerView numberOfRowsInComponent:component];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return [self.dataSource numberOfComponentsInPickerView:thePickerView];
}

@end
