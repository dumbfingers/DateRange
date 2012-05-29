//
//  DateRangeViewController.m
//  DateRange
//
//  Created by Yaxi Ye on 25/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateRangeViewController.h"
@interface DateRangeViewController()
@property (retain, nonatomic) id pointer;
@property (retain, nonatomic) id actionSheetPointer;
@end

@implementation DateRangeViewController
@synthesize result = _result;
@synthesize pickStart = _pickStart;
@synthesize pickEnd = _pickEnd;
//@synthesize calcRange = _calcRange;
//@synthesize datePicker = _datePicker;
@synthesize dateSelected = _dateSelected;
@synthesize pointer = _pointer;
@synthesize actionSheetPointer = _actionSheetPointer;

-(IBAction)showDatePicker:(UIButton *)sender {
    //add action sheet for dismiss button
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
//    _actionSheet.title = @"";
//    _actionSheet.delegate = self;
    
    //Use the pointer as reference
    _actionSheetPointer = actionSheet;
    
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    [pickerToolbar sizeToFit];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    NSMutableArray *barItems = [[NSMutableArray alloc]init];
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc]initWithTitle:@"Dismiss"style:UIBarButtonItemStyleDone target:self action:@selector(done_clicked:)];
    [barItems addObject:dismissButton];
    [pickerToolbar setItems:barItems animated:YES];
    
    UIDatePicker *datepicker = [[UIDatePicker alloc] init];
//    datepicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    datepicker.datePickerMode = UIDatePickerModeDate;
    [datepicker addTarget:self action:@selector(dueDateChanged:) forControlEvents:UIControlEventValueChanged];
//    CGSize pickerSize = [datepicker sizeThatFits:CGSizeZero];
//    datepicker.frame = CGRectMake(0.0, 40, pickerSize.width, 0);
    datepicker.frame = CGRectMake(0.0, 40.0, 320.0, 216.0);
    datepicker.backgroundColor = [UIColor blackColor];
    
    [actionSheet addSubview:pickerToolbar];
    [actionSheet addSubview:datepicker];
    [actionSheet showInView:self.view];
    [actionSheet setBounds:CGRectMake(0,0,320,480)];
//    [datepicker release];
    _pointer = sender;
}

-(void)dueDateChanged:(UIDatePicker *)sender {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    _dateSelected = [dateFormatter stringFromDate:[sender date]];
    [self setButtonTitleWithDate:_pointer];
//    [dateFormatter release];
}

-(void)done_clicked:(UIActionSheet *)sender
{
    [_actionSheetPointer dismissWithClickedButtonIndex:0 animated:YES];
}

- (IBAction)setButtonTitleWithDate:(UIButton *)sender {
    [sender setTitle:_dateSelected forState:UIControlStateNormal];
}

-(IBAction)doCalculation:(id)sender {
    
}

- (void)dealloc {
//    [_pointer release];
    
}


@end
