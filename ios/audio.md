# 音频


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [音频](#音频)
	* [理论](#理论)
		* [采样率](#采样率)
		* [声音强度](#声音强度)
	* [文档说明](#文档说明)
		* [AudioUnit](#audiounit)
			* [AudioUnitEffect](#audiouniteffect)
				* [AVAudioUnitReverb](#avaudiounitreverb)
				* [AVAudioUnitEQ](#avaudiouniteq)
				* [AVAudioUnitDistortion](#avaudiounitdistortion)
				* [AVAudioUnitDelay](#avaudiounitdelay)
		* [AVFoundation](#avfoundation)
			* [AVAudioSession](#avaudiosession)
				* [通知](#通知)
			* [AVAudioEngine](#avaudioengine)
			* [AVAudioFile](#avaudiofile)
			* [AVAudioTime](#avaudiotime)
			* [AVAudioNode](#avaudionode)
			* [AVAudioPlayerNode](#avaudioplayernode)
				* [`playAtTime`](#playattime)
	* [使用](#使用)
		* [PCM 转 AAC](#pcm-转-aac)
		* [播放](#播放)
	* [格式](#格式)
		* [Linear PCM](#linear-pcm)
		* [AMR](#amr)
		* [AAC](#aac)
		* [MP3](#mp3)
	* [Other](#other)
	* [Q&A](#qa)
		* [References](#references)

<!-- /code_chunk_output -->


## 理论

### 采样率

### 声音强度

单们：分贝，可为负数

## 文档说明

* CoreAudio
* AudioToolbox
  * AudioQueue
  * AudioSession
* AudioUnit
* AVFoundation
  * AVAudioSession
  * AVAudioEngine

>CoreAudio
>>OpenAL
>>AudioToolbox
>>AudioUnit
>>>AVFoundation

### AudioUnit

音频单元

#### AudioUnitEffect

效果单元

##### AVAudioUnitReverb

混响

##### AVAudioUnitEQ

均衡器

##### AVAudioUnitDistortion

失真

##### AVAudioUnitDelay

延迟

### AVFoundation

对 OpenAL AudioToolbox AudioUnit 的高级封装

#### AVAudioSession

##### 通知

* AVAudioSessionInterruptionNotification
* AVAudioSessionRouteChangeNotification

#### AVAudioEngine

音频引擎

* attachNode 把效果附着到音频引擎
* connect 连接各个节点

#### AVAudioFile

音频文件

* length: sample frame 数量
* framePosition: 下一个读或者写的位置

#### AVAudioTime

时间

* hostTimeValid hostTime 是否有效
* hostTime 主机时间，OSX 上参考 <CoreAudio/HostTime.h> AudioConvertHostTimeToNanos() 把 hostTime 转成纳秒
* sampleTimeValid 采样时间是否有效
* sampleTime
* sampleRate 采样率

#### AVAudioNode

* lastRenderTime 最后使用的时间

#### AVAudioPlayerNode

##### `playAtTime`

```
[_player reset];

```
使用之前如果还在播放必须 pause

## 使用

### PCM 转 AAC

* [将Mic采集的PCM转成AAC](https://github.com/ChengyangLi/XDXPCMToAACDemo)
* [Audio Converter File Convert Test](https://developer.apple.com/library/archive/samplecode/iPhoneACFileConvertTest/Introduction/Intro.html)
* AVAudioConverter convert AVAudioPCMBuffer to AAC
* <https://stackoverflow.com/q/38663496/5266652> [推荐，简单可用]

### 播放


```
@property (weak,nonatomic) AVAudioPlayerNode *player;
@property (weak,nonatomic) AVAudioFile *file;

AVAudioFramePosition songLengthSamples;
float sampleRateSong;
float lengthSongSeconds;
float startInSongSeconds;


lengthSongSamples = self.file.length;
AVAudioFormat *songFormat = self.file.processingFormat;
sampleRateSong = songFormat.sampleRate;
// 音频文件的时长（秒）
lengthSongSeconds=lengthSongSamples/sampleRateSong;

if(self.player.isPlaying){
    AVAudioTime *nodeTime=self.player.lastRenderTime;
    AVAudioTime *playerTime=[self.player playerTimeForNodeTime:nodeTime];
    float elapsedSeconds=startInSongSeconds+((double)playerTime.sampleTime/sampleRateSong);
    NSLog(@"Elapsed seconds: %f",elapsedSeconds);    
}

{
a:,
b:null,
c:undefined
}
```

## 格式

### Linear PCM

录音的时候，默认是不压缩的 `Linear PCM` 格式。

### AMR

```
AMR format is no longer supported by Apple (since iOS 4.3).
```

AMR 格式从 iOS 4.3 开始不再支持

### AAC

有压缩的格式，声音效果比 MP3 好。WebView 不支持

### MP3

有压缩的格式，WebView 支持。

* [iOS-使用Lame转码:PCM->MP3](https://www.jianshu.com/p/06eaefee3314)

## Other

AVFoundation框架中的AVAudioPlayer和AVAudioRecorder类，用法简单，但是不支持流式，也就意味着在播放音频前，必须等到整个音频加载完成后，才能开始播放音频；录音时，也必须等到录音结束后才能获得录音数据。

## Q&A

Q1:

```
Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: 'required condition is false: format.sampleRate == hwFormat.sampleRate'
```

A:

```
AVAudioConverter *converter = [[AVAudioConverter alloc] initFromFormat:inputFormat toFormat:_audioFile.fileFormat];

AVAudioPCMBuffer *fileBuffer = [[AVAudioPCMBuffer alloc] initWithPCMFormat:_audioFile.fileFormat frameCapacity:INPUT_BUFFER_SIZE];
[converter convertToBuffer:fileBuffer fromBuffer:buffer error:nil];

```

Q2:

```
Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: 'required condition is false: IsFormatSampleRateAndChannelCountValid(format)'
```

Q3:

```
Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: '[[busArray objectAtIndexedSubscript:(NSUInteger)element] setFormat:format error:&nsErr]: returned false, error Error Domain=NSOSStatusErrorDomain Code=-10865 "(null)"'
```

Q4

```
Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: 'required condition is false: [_nodes containsObject: node]
```


Q5：

```
 Terminating app due to uncaught exception 'com.apple.coreaudio.avfaudio', reason: 'required condition is false: nullptr == Tap()
```

重复 `installTapOnBus`，需要先 `removeTapOnBus`

### References

* <https://stackoverflow.com/a/40697312/5266652>
* [AVAudioEngine Tutorial for iOS: Getting Started](https://www.raywenderlich.com/5154-avaudioengine-tutorial-for-ios-getting-started)
* [苹果官方例子](https://developer.apple.com/library/archive/samplecode/AVAEMixerSample/Introduction/Intro.html)
