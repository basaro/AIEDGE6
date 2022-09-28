# 第6回AIエッジコンテスト　ハードウェアリファレンス　

[第6回AIエッジコンテスト](https://signate.jp/competitions/732 'AIEDGE SIGNATE')で使える、ハードウェアリファレンスの紹介です。

ザイリンクス社のFPGAボード　KV260 AIビジョンスターターキット向けに作成しています。

KV260で必要なハードウェア構成を、RISCV、及び Vitis AI　のIPを搭載した、ファイルをまでを紹介します。

なお、ハードウェア構築のブログをまとめています。

[第６回AIEDGEコンテスト　KV260のハードウェア構築ブログのまとめ](https://qiita.com/basaro_k/items/337e8ef94e2b7da5dfc7 'AIEDGE6 HARDWARE')

# 動作環境

 OS:Ubuntu20.04LTS Ubuntu18.04LTS

 メモリー 32ギガバイト以上推奨　（１６ギガバイトのPCでも動作確認はしています）

 HDD（SDD)　空き容量　２００ギガバイト以上
  
  なお、Windows上のWSL2でも動作確認はしています。

# 開発環境
XILINX社　Vitis 2022.1 が必要です。
  
 
 [ダウンロードページ](https://japan.xilinx.com/support/download/index.html/content/xilinx/ja/downloadNav/vitis.html 'VITIS DOWNLOAD')を参照してください。
  
  Windowsで開発環境を整えたい方は、ブロクを記述しています。そちらを参照してください。
  
  [Windowsで、FPGA開発。WSL2を使って、Vitis2022.1の環境設定(AIエッジコンテスト対応版](https://qiita.com/basaro_k/items/04eea702c83a927f920c 'WSL INSTALL')

# ダウンロードが必要なファイル

次のファイルは、承認が必要なため、自動的にダウンロード出来ません。

各自ダウンロードして、AIEDGE6のフォルダーに入れてください。
  
#### ZYNQMPの共通イメージ

KV260上で動く、Linuxイメージ。コンパイル用ライブラリーも入っています。

[エンベデッド Vitis プラットフォーム向けの共通イメージ - 2022.1](https://japan.xilinx.com/support/download/index.html/content/xilinx/ja/downloadNav/embedded-platforms.html 'ZYNQMP IMAGE')

このページで、ZYNQMPの共通イメージを探して、ダウンロードします。

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/299213/26b3e5fd-d7b1-d1b1-8149-983f34cc7cac.png)

# 実行手順

スクリプトファイルを作っていますので、順番に実行します。
最後に、フォルダーと

###　ダウンロードファイル

自動的に、必要なファイルをダウンロードしてきます。

DPU、ラインタイムパッケージが対応します。

`source ./1_download.sh`

### Vitisプラットフォーム作成

KV260 で動作する、Vitis プラットフォームを作成します。

`source 2_makepfm.sh`

### RISCV 及び DPUが入った、Vitis アクセラレータの作成

RISCV　及び、Vitis AI用のDPUが入った、アクセラレータを作成します。
なお、RISCVは予め、VexRISCVをVerilog化したものを使用しています。
カスタマイズする方は、この部分の変更が必要になります。

`source 3_makeacc.sh`

### SDカードにコピーするファイルの作成

作成した、ファイルをSDカードにコピーできるようにまとめます。

`source 4_sdfiles.sh`

最後に scpfile に出来たものを、KV260にコピーして動作します。






  
  
  

