# Project Initialization

## Pre-required

virtual env が起動している

## Setup

- Setup Poetry

```bash
pip install poetry
```

- init poetry

```bash
poetry init --no-interaction
```

- `pyproject.toml` に以下のように書く

```toml
[project]
name = "automate-precedents-processing"
version = "0.1.0"
description = ""
authors = [
    {name = "yongwoon kim",email = "yongwoon.kim@webhani.com"}
]
readme = "README.md"
requires-python = ">=3.12"
dependencies = [
]

[tool.poetry]
name = "automate-precedents-processing"
version = "0.1.0"
description = ""
authors = ["yongwoon kim <yongwoon.kim@webhani.com>"]
readme = "README.md"
package-mode = false

[tool.poetry.dependencies]
python = "^3.12"

[tool.poetry.group.dev.dependencies]

[build-system]
requires = ["poetry-core>=2.0.0,<3.0.0"]
build-backend = "poetry.core.masonry.api"
```

- peotry install

```bash
cd backend & poetry install
```
