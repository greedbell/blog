# Touch ID 和 Face ID

[LocalAuthentication](https://developer.apple.com/documentation/localauthentication) 本地认证，包含 Touch ID 认证 和 Face ID 认证。

```objc
typedef NS_ENUM(NSInteger, LABiometryType)
{
    /// The device does not support biometry.
    LABiometryNone,
    /// The device supports Touch ID.
    LABiometryTypeTouchID,
    /// The device supports Face ID.
    LABiometryTypeFaceID,
} NS_ENUM_AVAILABLE(NA, 11_0) __WATCHOS_UNAVAILABLE __TVOS_UNAVAILABLE;

```

## LocalAuthentication.h

```objc
// 是否支持 local authentication
- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError * __autoreleasing *)error __attribute__((swift_error(none)));

// 权限
typedef NS_ENUM(NSInteger, LAPolicy)
{
    // 指纹授权使用。指纹解锁五次错误消失，不会自动弹出密码输入界面
    LAPolicyDeviceOwnerAuthenticationWithBiometrics NS_ENUM_AVAILABLE(10_12_2, 8_0) __WATCHOS_AVAILABLE(3.0) __TVOS_AVAILABLE(10.0) = kLAPolicyDeviceOwnerAuthenticationWithBiometrics,
    // 指纹和数字密码的授权使用。指纹解锁六次错误自动跳转密码输入
    LAPolicyDeviceOwnerAuthentication NS_ENUM_AVAILABLE(10_11, 9_0) = kLAPolicyDeviceOwnerAuthentication

} NS_ENUM_AVAILABLE(10_10, 8_0) __WATCHOS_AVAILABLE(3.0) __TVOS_AVAILABLE(10.0);

/**
 * 验证 touchID 或者 faceID
 * @para localizedReason 为什么要使用 Touch ID 或者 Face ID
 */
- (void)evaluatePolicy:(LAPolicy)policy
       localizedReason:(NSString *)localizedReason
                 reply:(void(^)(BOOL success, NSError * __nullable error))reply;

```

## References

* [LocalAuthentication](https://developer.apple.com/documentation/localauthentication)
* [iOS指纹识别](http://www.jianshu.com/p/3ff9d8edae8e)
* [TouchID使用以及特性说明](http://www.jianshu.com/p/194f5561f0af)
