#!/bin/bash

set -e

echo "🏗️  Dockerセットアップを開始します..."

# 必要なディレクトリの作成
echo "📁 必要なディレクトリを作成しています..."
mkdir -p credentials
mkdir -p data
mkdir -p logs


# # 環境変数ファイルの作成
# if [ ! -f .env ]; then
#     echo "⚙️  .envファイルを作成しています..."
#     cat > .env << 'EOF'
# # LLM API設定
# OPENAI_API_KEY=your_openai_key_here
# ANTHROPIC_API_KEY=your_anthropic_key_here

# # その他の設定
# TZ=Asia/Tokyo
# EOF
#     echo "✅ .envファイルが作成されました。必要な値を設定してください。"
# else
#     echo "✅ .envファイルは既に存在します。"
# fi

# Docker Composeファイルの検証
echo "🔍 Docker Composeファイルを検証しています..."
if docker compose config > /dev/null 2>&1; then
    echo "✅ Docker Composeファイルは正常です。"
else
    echo "❌ Docker Composeファイルにエラーがあります。"
    exit 1
fi

# Dockerイメージのビルド
echo "🏗️  Dockerイメージをビルドしています..."
docker compose build

# # 認証情報の確認
# echo "🔐 認証情報を確認しています..."
# if [ ! -f credentials/credentials.json ]; then
#     echo "⚠️  Google API認証情報が見つかりません。"
#     echo "📝 credentials/credentials.json にGoogle APIの認証情報を配置してください。"
#     echo "🔗 https://console.cloud.google.com/ からダウンロードできます。"
# else
#     echo "✅ Google API認証情報が見つかりました。"
# fi

# 権限の設定
echo "🔒 ディレクトリの権限を設定しています..."
chmod 755 data logs
chmod 700 credentials

echo "🎉 セットアップが完了しました！"
echo ""
echo "📋 次の手順："
echo "1. .env ファイルを編集して必要な環境変数を設定"
echo "2. credentials/credentials.json にGoogle API認証情報を配置"
echo "3. 以下のコマンドでコンテナを起動:"
echo "   docker-compose up -d"
echo ""
echo "💻 コンテナ操作："
echo "   コンテナ内に入る: docker-compose exec python_default_template_backend bash"
echo "   Pythonスクリプト実行: docker-compose exec python_default_template_backend poetry run python your_script.py"
echo "   状態確認: docker-compose ps"
echo "   ログ確認: docker-compose logs -f"
echo "   停止: docker-compose down"
