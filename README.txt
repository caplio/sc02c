【このカーネルについて】

このカーネルは、GT-I9100 update3をベースに、
sakuramilkさん、ほむほむさんの変更点を盛り込んだ
ものとなります。

公開状態になっていますが、基本的に自分用のビルドと
なります。

sakuramilkさん作成のinitramfs(dual boot)にて動作確認しています。

※build済みのinstall zip用イメージはこちら（dualboot仕様）
　http://dl.dropbox.com/u/3061279/sc02c-custom_kernel-0123_V15revertGPUUV.zip
　
　- 1st image place (system:mmcblk0p9  data:/xdata/data0 -> /data)
　- 2st image place (system:mmcblk0p12 data:/xdata/data1 -> /data)

--------------------------------------------------------------------------------
【Features （from Lulz Kernel)】

*supports Lulzactive governor v2 (default)
- http://tegrak2x.blogspot.com/2011/11/lulzactive-governor-v2.html

*supports 2nd Core
- http://tegrak2x.blogspot.com/2011/11/2nd-core.html

*supports advanced touch tune driver
- https://market.android.com/details?id=com.tegrak.touchmove

*supports BLN
- thanks to creams and neldar & sakuramilk
- get the source from creams' blog http://creamsnexus.blogspot.com/

*supports clockworkmod recovery

*based on GT-I9100 gingerbread_update3 source
*supports CIFS
*jhash3

× *supports Interactive governor Link (サポートしていません)
× *includes Tegrak Kernel functions (サポートしていません)

【from sakuramilk】

* TweakGS2の一部機能に対応
　- Vibrate 
　- DISPLAY

【etc】

* ld9040.c 10/20の明るさ追加
* CPU scaling level is changed from 5 to 11
　 (1200/1000/800/700/600/500/400/300/200/100/50MHz)

* BT_HID Driver From GalaxyNote [thx HomuHomu] 

※アップル - Magic Mouseは認識しない（再起動する）との情報有り
　実績は、RII mini bluetooth keyboardを確認してます。
　http://pub.slateblue.tk/days/day2060.html
