# 判例管理システム用 Dockerfile
FROM python:3.12.11-slim

# メンテナー情報
LABEL maintainer="your-email@example.com"
LABEL description="判例管理システム - 判例検索・PDF処理・Google Drive連携"

# 作業ディレクトリの設定
WORKDIR /app

# システム依存関係のインストール
RUN apt-get update && apt-get install -y \
    # 基本的なビルドツール
    build-essential \
    gcc \
    g++ \
    # LibreOffice（PDF変換用）
    libreoffice \
    # Pandoc（文書変換用）
    pandoc \
    # Chrome/Chromium（Selenium用）
    chromium \
    chromium-driver \
    # システムライブラリ
    libxml2-dev \
    libxslt1-dev \
    libffi-dev \
    libssl-dev \
    # フォント（日本語対応）
    fonts-noto-cjk \
    fonts-takao-gothic \
    fonts-takao-mincho \
    # その他ユーティリティ
    curl \
    wget \
    unzip \
    git \
    # 不要なパッケージを削除してイメージサイズを削減
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Poetryのインストール
ENV POETRY_HOME="/opt/poetry"
ENV POETRY_VENV_IN_PROJECT=1
ENV POETRY_NO_INTERACTION=1
ENV POETRY_CACHE_DIR=/tmp/poetry_cache
RUN pip install --upgrade pip && pip install poetry

# Poetryの設定ファイルをコピー
COPY pyproject.toml poetry.lock* ./

# 依存関係のインストール
RUN poetry install --only=main && rm -rf $POETRY_CACHE_DIR

# アプリケーションのソースコードをコピー
COPY . .

# ChromeDriverの環境変数設定
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver
ENV CHROME_BIN=/usr/bin/chromium

# 作業ディレクトリの権限設定
RUN chmod +x /app

# 非rootユーザーの作成（セキュリティ向上）
RUN useradd --create-home --shell /bin/bash appuser && \
    chown -R appuser:appuser /app
USER appuser

# 環境変数の設定
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# ヘルスチェック用エンドポイント
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import sys; sys.exit(0)" || exit 1

# ポート（必要に応じて）
EXPOSE 8000

# デフォルトコマンド
# CMD ["poetry", "run", "python", "main.py"]
CMD ["tail", "-f", "/dev/null"]