//
//  IOSDropdownPicker.h
//  IOSDropdownPicker
//
//  Created by Vincent Faller on 7/7/13.
//  Copyright (c) 2013 Vincent Faller. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IOSDropdownPickerDelegate;
@protocol IOSDropdownPickerDataSource;

@interface IOSDropdownPicker : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *dropdownPickerView;
    UIPickerView *pickerView;
    UIButton *dropdownButton;
    UIToolbar *pickerViewToolbar;
}

@property (nonatomic, weak) id <IOSDropdownPickerDelegate> delegate;
@property (nonatomic, weak) id <IOSDropdownPickerDataSource> dataSource;

@end

@protocol IOSDropdownPickerDelegate <UIPickerViewDelegate>
@optional
@end

@protocol IOSDropdownPickerDataSource <UIPickerViewDataSource>
@optional
@end    