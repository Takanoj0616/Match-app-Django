# ベースイメージの指定
FROM python:3.10-slim

# 作業ディレクトリの設定
WORKDIR /app

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Pythonの依存関係をコピー
COPY requirements.txt /app/requirements.txt

# 依存関係のインストール
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションコードをコピー
COPY . /app

# ポートの公開
EXPOSE 8000

# コマンドを実行
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]