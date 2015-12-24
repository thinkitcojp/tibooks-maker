# 注意事項

v1.0およびv1.0-RC1で、同梱されているRe:VIEW1.7.1に起因するバグ（listのキャプションが表示されない）が報告されています。
https://github.com/kmuto/review/commit/89fc75732e5527bc6ddf1d738379f7decf85cf64

`/Applications/tibooks-maker/lib/ruby/gems/2.2.0/gems/review-1.7.1/lib/review`

にある latexbuilder.rb の265行目を

`        common_code_block(id, lines, 'reviewlist', nil, lang) do |line, idx|`

から

`        common_code_block(id, lines, 'reviewlist', caption, lang) do |line, idx|`

に修正して保存しておきましょう。

# tibooks-maker
tibooks-maker is customized Re:VIEW-platform for [Think IT Books](https://thinkit.co.jp/tibooks,Think IT Books)

* OS X apps (all in one package)
 * Re:VIEW
 * Ruby
 * TeX Live
 * Fontset

 Copyright ©2015 Impress Corporation, An Impress Group Company. All rights reserved.<br>
 special thanks Munehiro Yamamoto (Green Cherry Ltd.)

## Installing

Download the latest Version.

https://github.com/suzukin/tibooks-maker/releases

## Getting Started

1. `tibooks-maker-1.0.dmg` から `tibooks-maker` フォルダを `/Applications/` フォルダへ差し替えコピーします。
1. ターミナル `Terminal.app` を起動して、
   `. /Applications/tibooks-maker/setup.sh` を実行すると、
   `tibooks-maker` の環境に切り替わります。
    ```bash
    $ . /Applications/tibooks-maker/setup.sh
     
    tibook-maker 1.0 (Cherry)
     
    [tibooks-maker]:~ $ 
    ```
1. `review-pdfmaker`, `review-epubmaker` コマンドを試します。

   ```bash
   [tibooks-maker]:~ $ review-pdfmaker --help
   Usage: review-pdfmaker configfile
   --help                       Prints this message and quit.
   --[no-]debug                 Keep temporary files.
   --ignore-errors              Ignore review-compile errors.
   [tibooks-maker]:~ $ review-epubmaker --help
   Usage: review-epubmaker [options] YAML_filename [export_filename]
   --help                       Prints this message and quit.
   [tibooks-maker]:~ $ 
   ```

