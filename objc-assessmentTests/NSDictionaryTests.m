//
//  NSDictionaryTests.m
//  objc-assessment
//
//  Created by azu on 07/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionaryTests.h"


@implementation NSDictionaryTests

// 空の辞書
- (void)testDictionaryEmpty {
    NSDictionary *dictionary /*= HERE*/;
    assertThat(dictionary, notNilValue());// nilではなく
    if (dictionary != nil){
        assertThat(dictionary, instanceOf([NSDictionary class]));// NSDictionaryのインスタンスで
        assertThat(dictionary, is(empty()));// 要素数が0の辞書
    }
}

// entryを持つ辞書の初期化
- (void)testDictionaryWithInit {
    NSDictionary *dictionary /*= HERE*/;
    assertThat(dictionary, hasEntry(@"key", @"value"));
    // key : @"key", value :@"value" というペア(entry)を持つ辞書
}

// 辞書にentryを追加する
- (void)testMutableDictionarySetObject {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    /*HERE*/
    assertThat(dictionary, hasEntry(@"key", @"value"));
}

// 辞書からentryを削除する
- (void)testMutableDictionaryRemove {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                               @"val1", @"key1",
                                                               @"val2", @"key2",
                                                               nil];
    /* HERE  key1 を削除する */
    assertThat(dictionary, hasCountOf(1));
    assertThat(dictionary, isNot(hasKey(@"key1")));
    assertThat(dictionary, hasEntry(@"key2", @"val2"));
}

// 全てのentryを削除
- (void)testMutableDictionaryRemoveAll {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                               @"val1", @"key1",
                                                               @"val2", @"key2",
                                                               @"val3", @"key3",
                                                               nil];
    /* HERE */
    assertThat(dictionary, notNilValue());
    if (dictionary != nil){
        assertThat(dictionary, instanceOf([NSDictionary class]));
        assertThat(dictionary, is(empty()));// 要素数が0の辞書
    }
}

// 辞書に辞書を追加する
- (void)testMutableDictionaryAddEntriesFromDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                               @"val1", @"key1",
                                                               nil];
    NSDictionary *dictionaryForAdd = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                              @"val2", @"key2",
                                                              nil];
    /* HERE */
    assertThat(dictionary, hasEntries(@"key1", @"val1", @"key2", @"val2", nil));
    /*
    dictionary = {
        key1 = val1;
        key2 = val2;
    }
    */
}
// difference between setObject:forKey: and setValue:forKey:
@end
