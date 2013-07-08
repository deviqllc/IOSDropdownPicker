//
//  ViewController.h
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IOSDropdownPicker.h"

@interface ViewController : UIViewController<IOSDropdownPickerDataSource, IOSDropdownPickerDelegate>
{
    IOSDropdownPicker *dropdownPicker;
    IOSDropdownPicker *dropdownPicker2;

    NSMutableArray *fooDataSource;
    NSMutableArray *fooDataSource2;
}

@end
