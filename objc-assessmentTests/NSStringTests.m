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
    NSString *string /*TODO: "test"文字列を代入*/;
    assertThat(string, equalTo(@"test"));

}

// 文字列の長さ
- (void)testStringLength {
    NSString *string = @"STRING";
    NSUInteger stringLength/*TODO: stringの長さを取得*/;
    assertThatInteger(stringLength, equalToInteger(6));
}

// 空文字列の作り方
- (void)testEmptyString {
    NSString *string /*TODO: 空の文字列を代入*/;
    assertThat(string, notNilValue());// nilではない
    assertThat(string, instanceOf([NSString class]));// NSStringクラスのインスタンス
    assertThatInteger([string length], equalToInteger(0));
}

// 文字列の追加
- (void)testAppendString {
    NSMutableString *string = [NSMutableString string];
    [string setString:@"This is "];
    NSString *pen = @"a Pen.";
    /*TODO: stringにpenを追加する*/
    assertThat(string, equalTo(@"This is a Pen."));
}

// 文字列の挿入
- (void)testInsertString {
    NSMutableString *numberString = [NSMutableString string];
    [numberString setString:@"0123789"];
    NSString *stringB = @"456";
    /*TODO: numberStringの4番目にBを挿入する*/
    assertThat(numberString, equalTo(@"0123456789"));
}

// 文字列の組み合わせ
- (void)testStringFormat {
    NSString *formattedString = nil;
    NSString *test = @"test";
    NSString *program = @"program";
    NSString *a = @"a";
    /*TODO: stringWithFormat:を使って組み立てる*/
    assertThat(formattedString, equalTo(@"test a program"));
}

// 文字列の切り出し - 3つのテスト
- (void)testSubString {
    NSString *string = @"0TEST5";
    NSString *subStringTo /*TODO: stringから4番目までを切り出す*/;
    assertThat(subStringTo, equalTo(@"0TEST"));
    NSString *subStringFrom  /*TODO: stringの1番目からを切り出す*/;
    assertThat(subStringFrom, equalTo(@"TEST5"));
    NSString *subStringRange  /*TODO: stringから1-4番までを切り出す*/;
    assertThat(subStringRange, equalTo(@"TEST"));
}

// 文字列の置換
- (void)testReplaceString {
    NSMutableString *string = [NSMutableString stringWithString:@"NO TEST, NO DOC"];
    /*TODO: "NO"を"YES"に置換する*/;
    assertThat(string, equalTo(@"YES TEST, YES DOC"));
}

// 文字列を数値に変換する
- (void)testConvertStringToNumber {
    NSString *string = @"10.0";
    NSInteger integer /*TODO: stringからNSIntegerにする*/;
    assertThatInteger(integer, equalToInteger(10));
    CGFloat cgFloat /*TODO: stringからfloatにする*/;
    assertThatFloat(cgFloat, equalToFloat(10.0));
}

@end
