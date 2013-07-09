//
//  ViewController.m
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Could figure out how to get this to work well in interface builder. Easier to just add it programatically
    dropdownPicker = [[IOSDropdownPicker alloc] initWithFrame:CGRectMake(10, 20, 300, 18)];
    dropdownPicker.delegate = self;
    dropdownPicker.dataSource = self;
    dropdownPicker.placeholder = @"Please select";
    
    // Change the font of the label that contains the choosen value
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:12];
    dropdownPicker.selectedValueFont = font;
    [self.view addSubview:dropdownPicker];
    
    dropdownPicker2 = [[IOSDropdownPicker alloc] initWithFrame:CGRectMake(10, 70, 300, 18)];
    dropdownPicker2.delegate = self;
    dropdownPicker2.dataSource = self;
    dropdownPicker2.placeholder = @"Please select";
    dropdownPicker2.dropdownBackground = [UIImage imageNamed:@"dropdown.png"];
    
    // Change the font of the label that contains the choosen value
    dropdownPicker2.selectedValueFont = font;
    [self.view addSubview:dropdownPicker2];
    
    // Create a data source for the UIPickerView within the IOSDropdownPicker
    fooDataSource = [[NSMutableArray alloc] init];
    [fooDataSource addObject:@"Item 1"];
    [fooDataSource addObject:@"Item 2"];
    [fooDataSource addObject:@"Item 3"];
    [fooDataSource addObject:@"Item 4"];
    [fooDataSource addObject:@"Item 5"];
    
    fooDataSource2 = [[NSMutableArray alloc] init];
    [fooDataSource2 addObject:@"Item 6"];
    [fooDataSource2 addObject:@"Item 7"];
    [fooDataSource2 addObject:@"Item 8"];
    [fooDataSource2 addObject:@"Item 9"];
    [fooDataSource2 addObject:@"Item 10"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IOSDropdownPickerDataSource Methods

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    if (thePickerView == dropdownPicker.pickerView)
    {
        return [fooDataSource count];
    }
    else
    {
        return [fooDataSource2 count];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

#pragma mark UIPickerViewDelegate Methods


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (thePickerView == dropdownPicker.pickerView)
    {
        return [fooDataSource objectAtIndex:row];
    }
    else
    {
        return [fooDataSource2 objectAtIndex:row];
    }
}

#pragma mark IOSDropdownPickerDelegate Methods

- (void)dropdownPickWillShow:(UIPickerView*)thePickerView;
{
    [dropdownPicker resignDropdownPickerView];
    [dropdownPicker2 resignDropdownPickerView];
}

@end
