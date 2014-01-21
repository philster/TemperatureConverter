//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Phil Wee on 1/19/14.
//  Copyright (c) 2014 Philster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fahrenheitTextField.text = [NSString stringWithFormat:@"%d", 32];
    self.celsiusTextField.text = [NSString stringWithFormat:@"%d", 0];
}

#pragma mark - UITextField methods

- (IBAction)onBeginEditing:(UITextField *)sender
{
    sender.backgroundColor = [UIColor yellowColor];
}

- (IBAction)onEndEditing:(UITextField *)sender
{
    sender.backgroundColor = [UIColor clearColor];
}

- (IBAction)updateValues:(UITextField *)sender
{
    if ([sender.text isEqualToString:@""])
    {
        // pad empty string with zero
        sender.text = @"0";
    }
    else if ([sender.text hasPrefix:@"0"] && [sender.text length] > 1)
    {
        // trim leading zero
        sender.text = [sender.text substringFromIndex:1];
    }
    if (sender == self.fahrenheitTextField)
    {
        float celsius = [self convertToCelsius:[sender.text floatValue]];
        self.celsiusTextField.text = [NSString stringWithFormat:@"%d", (int)round(celsius)];
    }
    else if (sender == self.celsiusTextField)
    {
        float fahrenheit = [self convertToFahrenheit:[sender.text floatValue]];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%d", (int)round(fahrenheit)];
    }
}

#pragma mark - conversion methods

- (float)convertToCelsius:(float)fahrenheit
{
    return (fahrenheit - 32) * 5.0 / 9;
}

- (float)convertToFahrenheit:(float)celsius
{
    return (celsius * 9.0) / 5 + 32;
}

@end
