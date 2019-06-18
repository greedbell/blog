# 状态栏透明

```java

  /**
   * 沉浸式状态栏
   *
   * M 及以上系统才支持 SYSTEM_UI_FLAG_LIGHT_STATUS_BAR 设置状态栏为深色，所以 LOLLIPOP > M 使用半透明状态栏背景实现
   */
  private void translucentStatusBar() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
      translucentMStatusBar();
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      translucentLollipopStatusBar();
    }
    // 适配魅族
    FlymeSetStatusBarLightMode(getWindow(), true);
    // 适配小米
    MIUISetStatusBarLightMode(getWindow(), true);
  }

  @RequiresApi(api = Build.VERSION_CODES.M)
  private void translucentMStatusBar() {
    Window window = getWindow();
    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
    window.setStatusBarColor(Color.TRANSPARENT);
    View decorView = getWindow().getDecorView();
    decorView.setSystemUiVisibility(
      View.SYSTEM_UI_FLAG_LAYOUT_STABLE
        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
        | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  }

  @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
  private void translucentLollipopStatusBar() {
    Window window = getWindow();
    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
    window.setStatusBarColor(Color.argb(100, 0, 0, 0));
    View decorView = getWindow().getDecorView();
    decorView.setSystemUiVisibility(
      View.SYSTEM_UI_FLAG_LAYOUT_STABLE
        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
  }

  /**
   * 设置状态栏图标为深色和魅族特定的文字风格，Flyme4.0以上
   * 可以用来判断是否为Flyme用户
   *
   * @param window 需要设置的窗口
   * @param dark   是否把状态栏字体及图标颜色设置为深色
   * @return boolean 成功执行返回true
   */
  public static boolean FlymeSetStatusBarLightMode(Window window, boolean dark) {
    boolean result = false;
    if (window != null) {
      try {
        WindowManager.LayoutParams lp = window.getAttributes();
        Field darkFlag = WindowManager.LayoutParams.class.getDeclaredField("MEIZU_FLAG_DARK_STATUS_BAR_ICON");
        Field meizuFlags = WindowManager.LayoutParams.class.getDeclaredField("meizuFlags");
        darkFlag.setAccessible(true);
        meizuFlags.setAccessible(true);
        int bit = darkFlag.getInt(null);
        int value = meizuFlags.getInt(lp);
        if (dark) {
          value |= bit;
        } else {
          value &= ~bit;
        }
        meizuFlags.setInt(lp, value);
        window.setAttributes(lp);
        result = true;
      } catch (Exception e) {
      }
    }
    return result;
  }

  /**
   * 设置状态栏字体图标为深色，需要MIUIV6以上
   *
   * @param window 需要设置的窗口
   * @param dark   是否把状态栏字体及图标颜色设置为深色
   * @return boolean 成功执行返回true
   */
  public static boolean MIUISetStatusBarLightMode(Window window, boolean dark) {
    boolean result = false;
    if (window != null) {
      Class clazz = window.getClass();
      try {
        int darkModeFlag = 0;
        Class layoutParams = Class.forName("android.view.MiuiWindowManager$LayoutParams");
        Field field = layoutParams.getField("EXTRA_FLAG_STATUS_BAR_DARK_MODE");
        darkModeFlag = field.getInt(layoutParams);
        Method extraFlagField = clazz.getMethod("setExtraFlags", int.class, int.class);
        if (dark) {
          extraFlagField.invoke(window, darkModeFlag, darkModeFlag);
          //状态栏透明且黑色字体
        } else {
          extraFlagField.invoke(window, 0, darkModeFlag);
          //清除黑色字体
        }
        result = true;
      } catch (Exception e) {
      }
    }
    return result;
  }
```
