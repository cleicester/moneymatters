//
//  CurrenciesViewController.m
//  MoneyMatters
//
//  Created by Chris Leicester on 03/06/2011.
//  Copyright (c) 2011 CocoaShed Ltd. All rights reserved.
//
//  This file is distributed under the terms of the MIT License found at
//  the end of this file.
//
#import "CurrenciesViewController.h"

@implementation CurrenciesViewController

- (id)init
{
    [super initWithStyle:UITableViewStylePlain];
    
    numbersArray = [[NSArray alloc] initWithObjects:
                    [NSDecimalNumber decimalNumberWithString:@"123456.78"],
                    [NSDecimalNumber decimalNumberWithString:@"12.34"],
                    [NSDecimalNumber decimalNumberWithString:@"55.56"],
                    [NSDecimalNumber decimalNumberWithString:@"55.58"],
                    nil];
    localeIdArray = [[NSArray alloc] initWithArray:[@"en_GB,de_CH,fr_FR,fr_CA,de_DE,ja_JP,ga_IE,en_IE,af_ZA,cs_CZ" componentsSeparatedByString:@","]];
    
    currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    return self;
}


- (void)dealloc
{
    [numbersArray release];
    [localeIdArray release];
    [currencyFormatter release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [localeIdArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [numbersArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier: [localeIdArray objectAtIndex:[indexPath row]]];
    
    NSString *localeGroupingSeparator = [[locale objectForKey:NSLocaleGroupingSeparator] retain];
    NSString *localeDecimalSeparator = [[locale objectForKey:NSLocaleDecimalSeparator] retain];
    NSString *localeCurrencySymbol = [[locale objectForKey:NSLocaleCurrencySymbol] retain];
    
    [currencyFormatter setLocale:locale];
    
    NSString *currency = [currencyFormatter stringFromNumber:[numbersArray objectAtIndex:[indexPath section]]];
    
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"] autorelease];
    
    [[cell textLabel] setText:currency];
    [[cell detailTextLabel] setText:[[[NSString alloc] initWithFormat:@"%@: %@ [%@] [%@] [%@]",[localeIdArray objectAtIndex:[indexPath row]], [numbersArray objectAtIndex:[indexPath section]], localeCurrencySymbol , localeGroupingSeparator, localeDecimalSeparator] autorelease]];
    
    NSLog(@"%@: %@ => %@ (currency symbol is: (%@), grouping separator is (%@) and decimal separator is: (%@)",[localeIdArray objectAtIndex:[indexPath row]], [numbersArray objectAtIndex:[indexPath section]], currency, localeCurrencySymbol , localeGroupingSeparator, localeDecimalSeparator);
    
    [localeGroupingSeparator release];
    [localeDecimalSeparator release];
    [localeCurrencySymbol release];
    [locale release];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Converting %@", [numbersArray objectAtIndex:section]];   
}
@end
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//