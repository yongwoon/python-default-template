# Python default Template

## Environment

| itme   | version |
| ------ | ------- |
| python | 3.12.11 |

Getting Start

## pre-requirement

- [pyenv](./docs/pyenv.md)
- python 3.12

- how to install

```bash
pyenv install 3.12.11

pyenv local 3.12.11
```

## Setup local via virtual env

- 仮想環境の作成

```bash
python -m venv venv
```

- 仮想環境をアクティベート

```bash
# Windows
venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

- 仮想環境の解除

```bash
deactivate
```

## Setup local with docker

```bash
./local_docker_setup.sh

# 実行ができなかったら `chmod +x local_docker_setup.sh` 実行
```

- Start docker

```bash
docker compose up
```
