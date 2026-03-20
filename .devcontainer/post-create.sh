#!/usr/bin/env bash

set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

export PATH="$HOME/.local/bin:$PATH"

cd "$(dirname "$0")/.."

uv sync

if [[ ! -f .env && -f .env.sample ]]; then
  cp .env.sample .env
fi

uv run python -m ipykernel install --user --name azure-ai-agent-maf --display-name "Python (Azure-AI-Agent-MAF)"

echo "Codespaces setup complete. Run 'az login' before using Azure OpenAI notebooks."