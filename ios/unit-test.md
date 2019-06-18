# iOS 单元测试

## XCTest

```
- (void)setUp {
    [super setUp];
    // 每次测试前调用，可以在测试之前创建在 test case 方法中需要用到的一些对象等
}

- (void)tearDown {
    // 每次测试结束时调用 tearDown 方法
    [super tearDown];
}

- (void)testExample {
    // 测试用例，可以用 XCTAssert（断言）来检测测试结果。
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        // 性能测试 block，block 内计算耗时
    }];
}
```

断言

```
//通用断言
XCTAssert(expression, format...)
//常用断言：
XCTAssertTrue(expression, format...)
XCTAssertFalse(expression, format...)
// == 判断是否相等
XCTAssertEqual(expression1, expression2, format...)
// equalTo 判断是否相等
XCTAssertEqualObjects(expression1, expression2, format...)
XCTAssertNotEqual(expression1, expression2, format...)
XCTAssertEqualWithAccuracy(expression1, expression2, accuracy, format...)
XCTAssertNotEqualWithAccuracy(expression1, expression2, accuracy, format...)
XCTAssertNil(expression, format...)
XCTAssertNotNil(expression, format...)

XCTFail(format...) //直接Fail的断言
```
