FROM python:3.6.6-alpine
COPY src /app
WORKDIR /app
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN pip3 install -r requirements.txt && \
 python3 -m textblob.download_corpora
EXPOSE 5050
ENTRYPOINT ["python3"]
CMD ["sentiment_analysis.py"]