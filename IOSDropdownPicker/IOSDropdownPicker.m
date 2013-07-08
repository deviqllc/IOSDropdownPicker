//
//  IOSDropdownPicker.m
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import "IOSDropdownPicker.h"

@implementation IOSDropdownPicker

@synthesize placeholder, selectedValueFont, dropdownBackground, pickerView;

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
    // Create view for UIPickerView
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    dropdownPickerView = [[UIView alloc] initWithFrame:CGRectMake(0, screenRect.size.height, screenRect.size.width, 224)];
    [self.superview addSubview:dropdownPickerView];
    
    // Create tool bar for Done button item above the UIPickerView
    pickerViewToolbar = [[UIToolbar alloc] init];
    pickerViewToolbar.frame = CGRectMake(0, 0, screenRect.size.width, 44);
    pickerViewToolbar.barStyle = UIBarStyleBlackOpaque;
    NSMutableArray *items = [[NSMutableArray alloc] init];
    [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerviewDoneTapped:)]];
    [pickerViewToolbar setItems:items animated:NO];
    [dropdownPickerView addSubview:pickerViewToolbar];

    // Create the UIPickerView
    pickerView = [[UIPickerView alloc] init];
    pickerView.frame = CGRectMake(0, pickerViewToolbar.frame.size.height, screenRect.size.width, dropdownPickerView.frame.size.height);
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = true;
    [dropdownPickerView addSubview:pickerView];
    
    // Create drop down button with image.

    if (dropdownBackground == nil)
    {
        dropdownButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
    else
    {
        dropdownButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [dropdownButton setBackgroundImage:dropdownBackground forState:UIControlStateNormal];
    }
    
    dropdownButton.backgroundColor = self.superview.backgroundColor;
    [dropdownButton addTarget:self
                       action:@selector(dropdownButtonTapped:)
             forControlEvents:UIControlEventTouchUpInside];
    [dropdownButton setTitle:@"" forState:UIControlStateNormal];
    dropdownButton.frame = rect;
    [self addSubview:dropdownButton];
    
    // Create label for selected text
    selectedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(dropdownButton.frame.size.width * .02, dropdownButton.frame.size.height * .1, dropdownButton.frame.size.width * .95, dropdownButton.frame.size.height *.8)];
    selectedValueLabel.font = selectedValueFont;
    selectedValueLabel.opaque = false;
    selectedValueLabel.backgroundColor = [UIColor clearColor];
    
    if ([placeholder length] > 0)
    {
        selectedValueLabel.text = placeholder;
    }
    
    [dropdownButton addSubview:selectedValueLabel];
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
    if ([self.delegate respondsToSelector:@selector(pickerView:titleForRow:forComponent:)])
    {
        return [self.delegate pickerView:thePickerView titleForRow:row forComponent:component];
    }
    else
    {
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *selected = [self pickerView:thePickerView titleForRow:row forComponent:component];
    selectedValueLabel.text = selected;
    
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)])
    {
        [self.delegate pickerView:thePickerView didSelectRow:row inComponent:component];
    }
}

#pragma mark Forwared UIPickerViewDataSource Delegate Methods

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([self.dataSource respondsToSelector:@selector(pickerView:numberOfRowsInComponent:)])
    {
        return [self.dataSource pickerView:thePickerView numberOfRowsInComponent:component];
    }
    else
    {
        return 0;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    if ([self.dataSource respondsToSelector:@selector(numberOfComponentsInPickerView:)])
    {
        return [self.dataSource numberOfComponentsInPickerView:thePickerView];
    }
    else
    {
        return 0;
    }
}

@end
