//
//  NSStringTests.m
//  objc-assessment
//
//  Created by azu on 07/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
// http://www.pwv.co.jp/~take/TakeWiki/index.php?iPhone%2F%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E5%9E%8B%E9%96%8B%E7%99%BA%E3%81%AE%E6%BA%96%E5%82%99t
// http://saturnboy.com/2011/08/intro-to-ochamcrest/
#import "NSStringTests.h"

#define HC_SHORTHAND

#import <OCHamcrestIOS/OCHamcrestIOS.h>

@implementation NSStringTests

// 文字列リテラル
- (void)testStringLiteral {
    NSString *string = @"/*HERE*/";
    assertThat(string, equalTo(@"test"));

}

// 文字列の長さ
- (void)testStringLength {
    NSString *string = @"STRING";
    NSUInteger stringLength /*= HERE*/;
    assertThatInteger(stringLength, equalToInteger(6));
}

// 空文字列の作り方
- (void)testEmptyString {
    NSString *string /*= HERE*/;
    STAssertNotNil(string, @"nilではない");
    STAssertEquals([string length], 0U, @"空の文字列");
}

// 文字列の追加
- (void)testAppendString {
    NSString *combinedString = nil;
    NSString *stringA = @"This is ";
    NSString *stringB = @"a Pen.";
    /*HERE*/
    assertThat(combinedString, equalTo(@"This is a Pen."));
}

// 文字列の組み合わせ
- (void)testStringFormat {
    NSString *formattedString = nil;
    NSString *test = @"test";
    NSString *program = @"program";
    NSString *a = @"a";
    /*HERE*/
    assertThat(formattedString, equalTo(@"test a program"));
}

// 文字列の切り出し - 3つのテスト
- (void)testSubString {
    NSString *string = @"0TEST5";
    NSString *subStringTo /*= HERE*/;
    assertThat(subStringTo, equalTo(@"0TEST"));
    NSString *subStringFrom /*= HERE*/;
    assertThat(subStringFrom, equalTo(@"TEST5"));
    NSString *subStringRange /*= HERE*/;
    assertThat(subStringRange, equalTo(@"TEST"));
}
// 文字列の置換
- (void)testReplaceString{
    NSString *string = @"NO TEST, NO DOC";
    NSString *replacedString /*= HERE*/;
    assertThat(replacedString, equalTo(@"YES TEST, YES DOC"));
}

@end
