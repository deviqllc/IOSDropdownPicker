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

@interface IOSDropdownPicker : UIControl<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIView *dropdownPickerView;
    UIPickerView *pickerView;
    UIButton *dropdownButton;
    UIToolbar *pickerViewToolbar;
    UILabel *selectedValueLabel;
}

@property (nonatomic) UIPickerView *pickerView;
@property (nonatomic, weak) id <IOSDropdownPickerDelegate> delegate;
@property (nonatomic, weak) id <IOSDropdownPickerDataSource> dataSource;
@property (nonatomic) NSString *placeholder;
@property (nonatomic, retain) UIFont *selectedValueFont; // default is nil (system font 17 plain)
@property (nonatomic) UIImage *dropdownBackground;

@end

@protocol IOSDropdownPickerDelegate <UIPickerViewDelegate>
@end

@protocol IOSDropdownPickerDataSource <UIPickerViewDataSource>
@end    