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
    IBOutlet IOSDropdownPicker *dropdownPicker;
    NSMutableArray *stateCodes;
}

@end
