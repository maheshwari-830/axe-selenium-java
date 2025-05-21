FROM python:3.6-slim
RUN pip install axeselenium==3.1.2
WORKDIR /axeselenium/tests
CMD ["axeselenium", "--outputdir", "/axeselenium/results", ".
