# 视频技术

## 直播和点播分别是什么意思？

* 点播：视频源已经事先存储于服务器之上的音视频文件，观众随时可以观看，类似优酷土豆、爱奇艺和腾讯视频。
* 推流：主播将本地视频源和音频源推送到服务器，在有些场景中也被称为“RTMP发布”。
* 直播：即直接观看主播实时推送过来的音视频数据，观众和视频源之间的时间延迟一般不会太长。

## 流媒体协议

### RTSP

> RTSP（Real Time Streaming Protocol） 是一种双向实时数据传输协议，它允许客户端向服务器端发送请求，如回放、快进、倒退等操作。

### RTMP

> RTMP(Real Time Messaging Protocol) 实时消息传送协议.是Adobe Systems公司为Flash播放器和服务器之间音频、视频和数据传输 开发的开放协议。

### MMS

> MMS (Microsoft Media Server Protocol)，中文“微软媒体服务器协议”，用来访问并流式接收 Windows Media 服务器中 .asf 文件的一种协议。

### HLS

> HLS(HTTP Live Streaming) 是苹果公司(Apple Inc.)实现的基于HTTP的流媒体传输协议，可实现流媒体的直播和点播

## 生产实际使用协议

其实行业内目前是点播采用HTTP flv基本就可以搞定了，还可以加上一些私有的头验证等。
而直播的话，大部分还是采用RTMP或者私有协议，原因是延时会比较小，RTMP本身也是为了直播设计的。

### 直播协议

RTMP、 HLS

### 推流协议

RTMP

### 点播格式

MP4、HLS和FLV

## 网页播放

### 原生 webview 播放

如果仅需要在移动设备的WebView上播放，我们可以选择使用html中嵌入hls播放。如下html能够在所有Safari或者安卓3.0以上的WebView上播放。这样就不需要使用第三方的播放器。

```html
<html lang="en">
    <head>
       <meta charset=utf-8/>
    </head>
    <body>
        <div id='player'>
           <video width="640" height="320" controls>
                <source src="http://10.10.5.119/live/livestream.m3u8" type="application/x-mpegURL">
           </video>
        </div>
    </body>
</html>
```

#### [VideoJS](https://github.com/videojs/video.js) 播放

如果我们要让我们的网页支持在所有浏览器上播放，我们就需要使用第三方的播放器。VideoJs是一个较好的播放器库，完全免费，不像JWPlayer一样需要付费才能使用一些高级功能。下面是一个播放的例子。你可以将source标签下的src换成你自己的直播流地址。需要注意的是rtmp流的type是rtmp/flv（flv 跟推流的时候FFmpegFrameRecorder设置的format有关）, hls 的type是application/x-mpegURL。

```html
<html>
  <head>
  <link href="http://vjs.zencdn.net/5.5.3/video-js.css" rel="stylesheet">

  <!-- If you'd like to support IE8 -->
  <script src="http://vjs.zencdn.net/ie8/1.1.1/videojs-ie8.min.js"></script>
</head>

<body>

  <h1>康康的直播间</h1>
 <video id="my-video" class="video-js" controls preload="auto" width="640" height="264"
 poster="https://img.alicdn.com/imgextra/i2/754328530/TB2FpxhkXXXXXa5XXXXXXXXXXXX_!!754328530.jpg" data-setup="{}">
    <source src="rtmp://10.10.5.119/live/livestream" type="rtmp/flv">
    <!-- 如果上面的rtmp流无法播放，就播放hls流 -->
    <source src="http://10.10.5.119/live/livestream.m3u8" type='application/x-mpegURL'>
    <p class="vjs-no-js">
      To view this video please enable JavaScript, and consider upgrading to a web browser that
      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
    </p>
 </video>

 <script src="http://vjs.zencdn.net/5.5.3/video.js"></script>
</body>
</html>
```

## Reference

* [视频直播解决方案-搭建你自己的直播平台](http://blog.campusapp.cn/2016/01/29/2016-01-29-%E7%9B%B4%E6%92%AD%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88-%E6%90%AD%E5%BB%BA%E4%BD%A0%E8%87%AA%E5%B7%B1%E7%9A%84%E7%9B%B4%E6%92%AD%E5%B9%B3%E5%8F%B0/)
* [在各端实现Rtmp和hls视频流的播放](http://blog.campusapp.cn/2016/01/30/2016-01-30-%E5%9C%A8%E5%90%84%E7%AB%AF%E5%AE%9E%E7%8E%B0Rtmp%E5%92%8Chls%E6%B5%81%E8%A7%86%E9%A2%91%E7%9A%84%E6%92%AD%E6%94%BE/)
* [视频播放相关的网络协议有哪些？](http://zhihu.com/question/20621558/answer/15661190)
* [nginx-rtmp-module](https://github.com/arut/nginx-rtmp-module) 支持 RTMP 和 HLS
* [nginx-vod-module](https://github.com/kaltura/nginx-vod-module) vod
