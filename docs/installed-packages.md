# Installed packages

## Poetry コマンドでの個別インストール

### 基本パッケージ

```bash
# Web スクレイピング
poetry add requests beautifulsoup4 lxml
poetry add selenium webdriver-manager

# Google API
poetry add gspread google-auth

# データ処理
poetry add pandas gspread-pandas
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
# いずれか選択
poetry add openai anthropic google-generativeai

# 核心ライブラリ
poetry add langchain langchain-core langchain-community

# LLM プロバイダー別（必要なもののみ選択）
poetry add langchain-openai
poetry add langchain-anthropic
poetry add langchain-google-genai
```

### 開発用依存関係

```bash
poetry add --group dev pytest black flake8 mypy
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
