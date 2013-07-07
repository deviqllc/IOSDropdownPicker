//
//  IOSDropdownPicker.h
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSDropdownPicker : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *dropdownPickerView;
    UIPickerView *pickerView;
    NSMutableArray *dataSource;
}

@end
