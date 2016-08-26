BUNDLEEXEC=
__epubmaker=${BUNDLEEXEC} review-epubmaker
__pdfmaker=${BUNDLEEXEC} review-pdfmaker

all: book.epub book.pdf book-sp.pdf

# book.epub: 電子書籍用EPUB（カラー画像）
book.epub: clean
	${__epubmaker} config.yml

# book.pdf: 電子書籍用PDF（カラー画像、閲覧用リンクあり、仕上がりサイズ）
book.pdf: clean
	${__pdfmaker} config.yml

# book-sp.pdf: 京葉SPおよびAmazonPOD用PDF（グレースケール画像、印刷用リンクなし、仕上がりサイズ）
book-sp.pdf: clean
	mkdir images-tmpGrayscale
	cp -r images/*.* images-tmpGrayscale
	mogrify -type Grayscale images/*.*
	${__pdfmaker} config-sp.yml
	rm -f images/*.*
	cp -r images-tmpGrayscale/*.* images
	rm -rf images-tmpGrayscale

# book-print.pdf: オフセット用PDF（グレースケール画像、印刷用リンクなし、トンボあり、デフォルトオフ）
book-print.pdf: clean
	mkdir images-tmpGrayscale
	cp -r images/*.* images-tmpGrayscale
	mogrify -type Grayscale images/*.*
	${__pdfmaker} config-print.yml
	rm -f images/*.*
	cp -r images-tmpGrayscale/*.* images
	rm -f images-Grayscale

# book-preview.pdf: 表示確認用PDF（フォント非埋め込み、デフォルトオフ）
book-preview.pdf: clean
	${__pdfmaker} config-preview.yml

clean:
	rm -f book*.pdf book*.epub
	rm -rf book-*
	rm -rf images-*
	find . -name "*~" -delete

## end of file
