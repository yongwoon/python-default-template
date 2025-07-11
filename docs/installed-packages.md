# Installed packages

## Poetry コマンドでの個別インストール

### 基本パッケージ

```bash
# Web スクレイピング
poetry add requests beautifulsoup4
poetry add selenium webdriver-manager

# Google API
poetry add gspread google-auth

# データ処理
poetry add pandas
```

### PDF・Word 操作

```bash
poetry add PyPDF2 pdfplumber python-docx
```

### 変換・ユーティリティ

```bash
poetry add pypandoc python-dotenv
```

### LLM 連携

```bash
# 核心ライブラリ（必須）
poetry add langchain langchain-core langchain-community

# OpenAI を使用する場合
poetry add langchain-openai openai

# Anthropic を使用する場合
poetry add langchain-anthropic anthropic

# Google Generative AI を使用する場合（オプション2: LangChain経由）
# 注意: この場合は google-generativeai をインストールしないでください
poetry add langchain-google-genai

# 複数プロバイダーを使用する場合（Google以外）
poetry add langchain-openai langchain-anthropic openai anthropic
```

### 開発用依存関係

```bash
poetry add --group dev black flake8

# postpone
poetry add --group dev pytest mypy
```

## 仮想環境の管理

```bash
# 環境作成・有効化
poetry install
poetry shell

# 依存関係の確認
poetry show
poetry show --tree

# 依存関係の更新
poetry update

# lockファイルの更新
poetry lock
```

## 環境別設定

### 開発環境

```bash
poetry install --with dev
```

### 本番環境

```bash
poetry install --only main
```
