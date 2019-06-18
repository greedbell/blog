# 监听 iOS App 新评论

* [Are there RSS feeds for iOS apps' reviews on the app store?](https://stackoverflow.com/questions/5891466/are-there-rss-feeds-for-ios-apps-reviews-on-the-app-store)
* [RSS Feed For Apple App Reviews](https://stackoverflow.com/questions/28279008/rss-feed-for-apple-app-reviews)


## 获取评论

* <https://itunes.apple.com/us/rss/customerreviews/id=1013727678/json>
* <https://itunes.apple.com/us/rss/customerreviews/page=1/id=1013727678/sortby=mostrecent/xml?urlDesc=/customerreviews/id=1013727678/json>
* https://itunes.apple.com/us/rss/customerreviews/page=1/id=1013727678/limit=10/xml
* https://itunes.apple.com/cn/rss/customerreviews/page=1/id=1013727678/limit=10/sortby=mostrecent/xml
* https://itunes.apple.com/cn/rss/customerreviews/id=1013727678/page=1/sortby=mostrecent/xml

* [itunes RSS feed Generator](https://rss.itunes.apple.com/us/?urlDesc=%2Fcustomerreviews)

> feed
>> entry[] 评论列表
>>> author
>>>> name
>>>>> label 评论用户名
>>>>
>>> title
>>>> label 评论标题
>>>
>>> content
>>>> label 评论内容
>>>
>>
>

## 实现

用 ifttt 的

* [New App Store Review](https://ifttt.com/applets/54794310d-new-app-store-review) 只能发给账号绑定的邮箱
* [RSS feed to email](https://ifttt.com/applets/54780245d-rss-feed-to-email) 能发多个邮箱，不过只能用自己的 gmail 邮箱发
