# filecleanコマンド
![test](https://github.com/toranomonn1124/robosys2026/actions/workflows/test.yml/badge.svg)
＜説明＞
・標準入力から読み込んだファイル名の空白を整理し、標準出力に表示するコマンドです。
・ファイル名の先頭と末尾の空白を削除し、連続する空白をアンダースコア（`_`）に変換します。
・空行は出力しません。
・このコマンドはファイル名を表示するだけで、実際のファイル名は変更しません。

## 機能

- ファイル名の先頭・末尾の空白を削除
- ファイル名の連続する空白を `_` に変換
- 空行を無視
- 複数のファイル名をまとめて処理

## 必要なソフトウェア

- Python
  - テスト対象バージョン：3.10～3.14

## インストール方法

リポジトリをダウンロードします。

```bash
$ git clone https://github.com/toranomonn1124/robosys2026.git
$ cd robosys2026
```

実行権限を設定します。

```bash
$ chmod +x fileclean
```

## 使用方法

標準入力からファイル名を渡して実行します。

```bash
$ printf "  report 01.txt  \nimage   02.png\n" | ./fileclean
report_01.txt
image_02.png
```

## テスト方法

次のコマンドでテストを実行できます。

```bash
$ bash ./test.bash
```

GitHubに変更をプッシュすると、GitHub Actionsによる自動テストが実行されます。

## テスト環境

- Ubuntu 24.04 LTS
- Python 3.10～3.14

## ライセンス

このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。

- SPDX-License-Identifier: BSD-3-Clause
- © 2026 （千葉工大　未来ロボティクス学科　25C1033　北川虎太郎）

## 参考・謝辞

コマンドの仕様検討、プログラムの作成、テスト項目の検討およびREADMEの作成にあたり、OpenAIのChatGPTを利用しました。
