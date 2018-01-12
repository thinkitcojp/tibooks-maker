OBJS=book.epub book.pdf book-sp.pdf book-print.pdf

BUNDLEEXEC=
__epubmaker=${BUNDLEEXEC} review-epubmaker
__pdfmaker=${BUNDLEEXEC} review-pdfmaker

all: ${OBJS}

# book.epub: 電子書籍用EPUB（カラー画像）
book.epub: config.yml
	test -L images && rm -f images ||:
	test -d images-epub && ln -s images-epub images
	${__epubmaker} $<
	test -L images && rm -f images ||:

# book.pdf: 電子書籍用PDF（カラー画像、閲覧用リンクあり、仕上がりサイズ）
book.pdf: config.yml
	test -L images && rm -f images ||:
	test -d images-pdf && ln -s images-pdf images
	${__pdfmaker} $<
	test -L images && rm -f images ||:

# book-sp.pdf: 京葉SPおよびAmazonPOD用PDF（グレースケール画像、印刷用リンクなし、仕上がりサイズ）
book-sp.pdf: config-sp.yml
	test -L images && rm -f images ||:
	test -d images-pdf && ln -s images-pdf images
	${__pdfmaker} $<
	test -L images && rm -f images ||:

# book-print.pdf: オフセット用PDF（グレースケール画像、印刷用リンクなし、トンボあり、デフォルトオフ）
book-print.pdf: config-print.yml
	test -L images && rm -f images ||:
	test -d images-pdf && ln -s images-pdf images
	${__pdfmaker} $<
	test -L images && rm -f images ||:

clean:
	rm -rf ${OBJS} book-pdf book-*-pdf book-epub
	find . -name "*~" -delete
	test -L images && rm -f images ||:

.PHONY: clean

## end of file
