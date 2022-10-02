# 第6回AIエッジコンテスト　ハードウェアリファレンス　

[第6回AIエッジコンテスト](https://signate.jp/competitions/732 'AIEDGE SIGNATE')で使える、ハードウェアリファレンスの紹介です。

ザイリンクス社のFPGAボード　KV260 AIビジョンスターターキット向けに作成しています。

KV260で必要なハードウェア構成を、RISCV、及び Vitis AI　のIPを搭載した、ファイルをまでを紹介します。

なお、ハードウェア構築のブログをまとめています。

[第６回AIEDGEコンテスト　KV260のハードウェア構築ブログのまとめ](https://qiita.com/basaro_k/items/337e8ef94e2b7da5dfc7 'AIEDGE6 HARDWARE')

# 動作環境

 OS:Ubuntu20.04LTS Ubuntu18.04LTS

 メモリー 32ギガバイト以上推奨　（

 HDD（SDD)　空き容量　２００ギガバイト以上


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


このリソースをダウンロードします。

`git clone --recursive https://github.com/basaro/AIEDGE6.git`


スクリプトファイルを作っていますので、順番に実行します。


### ダウンロードファイル

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

同時動作CPUの数を１６にしています。パソコンのメモリーが少ない方は、エラーが出ます。必要に応じて、3_makeacc.shのv++の--vivado.synth.jobs の数字を減らしてください。 

`source 3_makeacc.sh`

AIEDGE/vitisに生成したファイルが入ります。
AIエッジコンテストの参加希望で、KV260の希望の方は、AIEDGE6/vitis以下を圧縮後、送信すれば、あたる確率は高くなります。

### SDカードにコピーするファイルの作成

作成した、ファイルをSDカードにコピーできるようにまとめます。

`source 4_sd_aiedge.sh`

最後に sd_aiedge に出来たものを、KV260にコピーして動作します。

# ソフトウェアの動作

今回は、ハードウェアリファレンスなので、ここまでです。
KV260での動かし方は、次のところなどを参照してください。

[KV260にVitis AIを組み込む(AIEDGEコンテスト対応版）](https://qiita.com/basaro_k/items/dc439ffbc3ea3aed5eb2 'AIEDGE6 AI')

この、Gitでのリファレンスで、ブログの１項目は終わってますので、実際に動かすには、２の項目から進めてください。




