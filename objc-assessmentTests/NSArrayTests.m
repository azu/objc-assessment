//
//  NSArrayTests.m
//  objc-assessment
//
//  Created by azu on 07/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define HC_SHORTHAND

#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import "NSArrayTests.h"

@implementation NSArrayTests

// 空の配列
- (void)testArrayEmpty {
    NSArray *array /*= HERE*/;
    assertThat(array, notNilValue());// nilではなく
    if (array != nil){
        assertThat(array, instanceOf([NSArray class]));//NSArrayのインスタンス
        assertThat(array, is(empty()));// 要素数が0の空の配列
    }
}

// 要素を持つ配列の初期化
- (void)testArrayWithInit {
    NSArray *array = [NSArray arrayWithObjects:/*HERE*/ nil];
    assertThat(array, hasCountOf(3));// [array count] == 3
}

// MutableArrayに要素を追加する
- (void)testMutableArrayAddObject {
    NSMutableArray *array = [NSMutableArray array];// require init
    [array addObject:@"object"];// *1
    /* HERE */
    assertThat(array, hasItem(@"item"));// item という文字列の要素を持っている
    assertThat(array, hasItem(@"object"));// *1 always pass
    assertThat([array lastObject], equalTo(@"item"));// 配列の最後の要素は item
}

//  MutableArrayから要素を削除する
- (void)testMutableArrayRemoveObject {
    NSMutableArray *array = [NSMutableArray array];// require init
    [array addObject:@"object"];
    /* HERE */
    assertThat(array, isNot(hasItem(@"object")));// object という文字列の要素を持ってない
}

//  MutableArrayの任意の位置に要素を追加する
- (void)testMutableArrayInsertFirst {
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"a", @"b", @"c", nil];
    /* HERE */
    assertThat(array, contains(@"XXX", @"a", @"b", @"c", nil));// XXX ,a , b, c という順に要素が並んでる
}

// 配列を区切り文字で結合
- (void)testArrayJoin {
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    NSString *joinedArray /*= HERE*/;
    assertThat(joinedArray, equalTo(@"a,b,c"));
}

// 配列に数字をオブジェクトとして入れる
- (void)testArrayWithNSNumber {
    NSArray *array /*= HERE */;

    NSNumber *objectAtFirst = [array objectAtIndex:0];// 配列の0番目の要素は
    assertThat(objectAtFirst, instanceOf([NSNumber class]));// NSNumberオブジェクトで
    assertThatInteger([objectAtFirst integerValue], equalToInteger(10));// 10という数字を持つ

}

// 配列の数値を合計する
- (void)testArraySum {
    NSArray *array = [NSArray arrayWithObjects:
                                  [NSNumber numberWithInteger:1],
                                  [NSNumber numberWithInteger:2],
                                  [NSNumber numberWithInteger:3],
                                  nil];
    NSInteger total = 0;
    /* HERE */
    assertThatInteger(total, equalToInteger(6));
}

// ソート関数
NSComparisonResult compareInteger(id value1, id value2, void *context) {
    NSInteger integerValue1 = [(NSNumber *) value1 integerValue];
    NSInteger integerValue2 = [(NSNumber *) value2 integerValue];

    if (integerValue1 > integerValue2){
        return NSOrderedDescending;
    } else if (integerValue1 < integerValue2){
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
}
// 配列を数字昇順にソートする
- (void)testArraySort {
    NSArray *array = [NSArray arrayWithObjects:
                                  [NSNumber numberWithInteger:2],
                                  [NSNumber numberWithInteger:3],
                                  [NSNumber numberWithInteger:1],
                                  nil];
    /* HERE  sortedArrayUsingFunction:compareInteger */
    assertThat(array, contains(equalToInteger(1), equalToInteger(2), equalToInteger(3), nil));
}

@end
