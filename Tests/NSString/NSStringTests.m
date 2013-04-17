//
//  NSStringTests.m
//  objc-assessment
//
//  Created by azu on 07/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSStringTests.h"

@implementation NSStringTests

// 文字列リテラル
- (void)testStringLiteral {
    NSString *string = @"test";
    assertThat(string, equalTo(@"test"));

}

// 文字列の長さ
- (void)testStringLength {
    NSString *string = @"STRING";
    NSUInteger stringLength = [string length];
    assertThatInteger(stringLength, equalToInteger(6));
}

// 空文字列の作り方
- (void)testEmptyString {
    NSString *string = [NSString string];
    assertThat(string, notNilValue());// nilではない
    assertThat(string, instanceOf([NSString class]));// NSStringクラスのインスタンス
    assertThatInteger([string length], equalToInteger(0));
}

// 文字列の追加
- (void)testAppendString {
    NSMutableString *string = [NSMutableString string];
    [string setString:@"This is "];
    NSString *pen = @"a Pen.";
    [string appendString:pen];
    assertThat(string, equalTo(@"This is a Pen."));
}

// 文字列の挿入
- (void)testInsertString {
    NSMutableString *numberString = [NSMutableString string];
    [numberString setString:@"0123789"];
    NSString *stringB = @"456";
    [numberString insertString:stringB atIndex:4u];
    assertThat(numberString, equalTo(@"0123456789"));
}

// 文字列の組み合わせ
- (void)testStringFormat {
    NSString *formattedString = nil;
    NSString *test = @"test";
    NSString *program = @"program";
    NSString *a = @"a";
    formattedString = [NSString stringWithFormat:@"%@ %@ %@", test, a, program];
    assertThat(formattedString, equalTo(@"test a program"));
}

// 文字列の切り出し - 3つのテスト
- (void)testSubString {
    NSString *string = @"0TEST5";
    NSString *subStringTo = [string substringToIndex:5];
    assertThat(subStringTo, equalTo(@"0TEST"));
    NSString *subStringFrom = [string substringFromIndex:1];
    assertThat(subStringFrom, equalTo(@"TEST5"));
    NSString *subStringRange = [string substringWithRange:NSMakeRange(1, 4)];
    assertThat(subStringRange, equalTo(@"TEST"));
}

// 文字列の置換
- (void)testReplaceString {
    NSString *string = @"NO TEST, NO DOC";
    string = [string stringByReplacingOccurrencesOfString:@"NO" withString:@"YES"];
    assertThat(string, equalTo(@"YES TEST, YES DOC"));
}

// 文字列を数値に変換する
- (void)testConvertStringToNumber {
    NSString *string = @"10.0";
    NSInteger integer = [string integerValue];
    assertThatInteger(integer, equalToInteger(10));
    CGFloat cgFloat = [string floatValue];
    assertThatFloat(cgFloat, equalToFloat(10.0));
}

@end
