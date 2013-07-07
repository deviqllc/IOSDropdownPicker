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
    dropdownPicker.delegate = self;
    dropdownPicker.dataSource = self;
    
    stateCodes = [[NSMutableArray alloc] init];
    [stateCodes addObject:@"AK"];
    [stateCodes addObject:@"AL"];
    [stateCodes addObject:@"AR"];
    [stateCodes addObject:@"AZ"];
    [stateCodes addObject:@"CA"];
    [stateCodes addObject:@"CO"];
    [stateCodes addObject:@"CT"];
    [stateCodes addObject:@"DE"];
    [stateCodes addObject:@"DC"];
    [stateCodes addObject:@"FL"];
    [stateCodes addObject:@"GA"];
    [stateCodes addObject:@"HI"];
    [stateCodes addObject:@"IA"];
    [stateCodes addObject:@"ID"];
    [stateCodes addObject:@"IL"];
    [stateCodes addObject:@"IN"];
    [stateCodes addObject:@"KS"];
    [stateCodes addObject:@"KY"];
    [stateCodes addObject:@"LA"];
    [stateCodes addObject:@"MA"];
    [stateCodes addObject:@"MD"];
    [stateCodes addObject:@"ME"];
    [stateCodes addObject:@"MI"];
    [stateCodes addObject:@"MN"];
    [stateCodes addObject:@"MO"];
    [stateCodes addObject:@"MS"];
    [stateCodes addObject:@"MT"];
    [stateCodes addObject:@"NC"];
    [stateCodes addObject:@"ND"];
    [stateCodes addObject:@"NE"];
    [stateCodes addObject:@"NH"];
    [stateCodes addObject:@"NJ"];
    [stateCodes addObject:@"NM"];
    [stateCodes addObject:@"NV"];
    [stateCodes addObject:@"NY"];
    [stateCodes addObject:@"OH"];
    [stateCodes addObject:@"OK"];
    [stateCodes addObject:@"OR"];
    [stateCodes addObject:@"PA"];
    [stateCodes addObject:@"RI"];
    [stateCodes addObject:@"SC"];
    [stateCodes addObject:@"SD"];
    [stateCodes addObject:@"TN"];
    [stateCodes addObject:@"TX"];
    [stateCodes addObject:@"UT"];
    [stateCodes addObject:@"VT"];
    [stateCodes addObject:@"VA"];
    [stateCodes addObject:@"WA"];
    [stateCodes addObject:@"WI"];
    [stateCodes addObject:@"WV"];
    [stateCodes addObject:@"WY"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return [stateCodes count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [stateCodes objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
}

@end
