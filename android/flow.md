# 控制流程

## 第一个 Activity

`AndroidManifest.xml` 的 `application` 中被声明为 `android.intent.category.LAUNCHER` 或 `android.intent.action.MAIN` 的  Activity。eg：

```xml
<activity android:name=".MainActivity" android:label="@string/app_name">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
```

## Activity 跳转

```java
Intent intent = new Intent();
intent.setClass(this, WebViewActivity.class);
startActivity(intent);
```

跳转 WebViewActivity.java

## Activity 关联 布局文件

```java
protected void onCreate(Bundle savedInstanceState)  {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.webview);
}    
```

关联 webview.xml

## Fragement 关联 布局文件

```java
public class TitleFragment extends Fragment {
	@Override  
    public View onCreateView(LayoutInflater inflater, ViewGroup container,  
            Bundle savedInstanceState)  
    {
				View view = inflater.inflate(R.layout.list, null, false);
		}
}
```

TitleFragment 关联 list

## android.R

```java
int i ;
// 根据id找资源
i = android.R.id.item_id;
// 动画
i = android.R.anim.fade_in;
// 数组
i = android.R.array.emailAddressTypes;
// 颜色
i = android.R.color.darker_gray;
// 尺寸
i = android.R.dimen.app_icon_size;
// 可绘制图片
i = android.R.drawable.title_bar;
// 字符串
i = android.R.string.cancel;
```
