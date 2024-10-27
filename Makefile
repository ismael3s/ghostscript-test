run:
	docker build -t pdfcompresser .
	docker run -v $(PWD)/pdf:/scripts/pdf pdfcompresser