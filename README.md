IOSDropdownPicker
=================

The IOSDropdownPicker is a simple collection of existing iOS controls to create what looks and feels a lot like a web 
drop down.

In the following screenshots you will see two IOSDropdownPicker controls. The control on top is the default look of the 
IOSDropdownpicker, the bottom control is an example of a custom background on the IOSDropdownPicker control.

<table>
<tr>
<td>
<img src="https://raw.github.com/deviqllc/IOSDropdownPicker/master/screenshot.png"  width="300px"/>
</td>
<td>
<img src="https://raw.github.com/deviqllc/IOSDropdownPicker/master/screenshot2.png"  width="300px"/>

</td>
</table>

Implementation is simple

<ul>
  <li>Download IOSDropdownPicker</li>
  <li>Drag IOSDropdownPicker folder into your project in Xcode</li>
</ul>

Once the IOSDropdownPicker is added to your project, you need to implement the IOSDropdownPickerDelegate and 
IOSDropdownPickerDataSource protocols

<h4>Header File</h4>
<pre>
<code>

...

#import "IOSDropdownPicker.h"

@interface ViewController : UIViewController<IOSDropdownPickerDataSource, IOSDropdownPickerDelegate>
{
    IOSDropdownPicker *dropdownPicker;
    NSMutableArray *someData;
}
...

</code>
</pre>

Now you have to add the IOSDropdownPicker to your view

<h4>Code File</h4>
<pre>
<code>

...

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Add dropdownPicker to view
    dropdownPicker = [[IOSDropdownPicker alloc] initWithFrame:CGRectMake(10, 20, 300, 18)];
    dropdownPicker.delegate = self;
    dropdownPicker.dataSource = self;
    dropdownPicker.placeholder = @"Please select";
    [self.view addSubview:dropdownPicker];

  ...
  
    // Create a data source for the UIPickerView within the IOSDropdownPicker
    someData = [[NSMutableArray alloc] init];
    [someData addObject:@"Item 1"];
    [someData addObject:@"Item 2"];
    [someData addObject:@"Item 3"];
    [someData addObject:@"Item 4"];
    [someData addObject:@"Item 5"];
}

...

#pragma mark IOSDropdownPickerDataSource Methods

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
  return [someData count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

#pragma mark UIPickerViewDelegate Methods


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [someData objectAtIndex:row];
}

...
</code>
</pre>

That's it!
