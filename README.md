# 🤖 Azure AI Agent Workshop - Microsoft Agent Framework Edition

**Microsoft Agent Framework와 Azure OpenAI를 활용한 멀티 에이전트 시스템 구축 워크숍**

이 리포지토리는 **AI Agent Workshop**의 실습용 코드와 자료를 제공합니다.
Microsoft Agent Framework를 사용하여 기본 에이전트부터 고급 멀티 에이전트 시스템까지 단계별로 학습할 수 있습니다.

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue)](https://www.python.org/)
[![Agent Framework](https://img.shields.io/badge/Agent%20Framework-1.0.0b-green)](https://github.com/microsoft/agent-framework)
[![Azure OpenAI](https://img.shields.io/badge/Azure%20OpenAI-GPT--4o--mini-orange)](https://azure.microsoft.com/en-us/products/ai-services/openai-service)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📋 워크숍 개요

### 🎯 학습 목표
- **단일 에이전트**에서 **멀티 에이전트 시스템**까지 점진적 학습
- **Azure OpenAI** 서비스와 **Microsoft Agent Framework** 실무 활용
- **실제 비즈니스 시나리오**에 적용 가능한 AI 에이전트 구현
- **웹 검색, 파일 처리, 코드 실행** 등 다양한 기능 통합

### 🆕 AutoGen에서 Microsoft Agent Framework로의 전환
Microsoft Agent Framework는 AutoGen과 Semantic Kernel의 장점을 통합한 차세대 프레임워크입니다:
- **통합 API**: AutoGen의 간결함 + Semantic Kernel의 안정성
- **워크플로우 기반 오케스트레이션**: Graph-based 워크플로우 지원
- **엔터프라이즈급 기능**: OpenTelemetry 통합, 타입 안정성, 필터링
- **확장성**: Python과 .NET 양쪽 지원
- **MCP (Model Context Protocol)**: 표준 프로토콜을 통한 도구 통합

### 🏗️ 워크숍 구조
```
📚 Basic Concepts     → 🔧 Advanced Features    → 🚀 Real-world Applications
단일 에이전트 구현      멀티 에이전트 협업          비즈니스 시나리오 적용
상태 관리               워크플로우 기반 조정       복잡한 작업 자동화
도구 통합               그래프 기반 실행           고객 서비스 자동화
```

---

## 🛠️ 환경 설정

### 1️⃣ 필수 요구사항
- **Python 3.10+** (권장: 3.11 또는 3.12)
- **Azure OpenAI** 서비스 접근 권한
- **Azure CLI 로그인 가능 환경** (`az login` 필요)
- **Visual Studio Code** + Jupyter Extension
- **GitHub 계정**

### 2️⃣ 설치 및 설정

```bash
# [Local에서 수행 시] 1. 저장소 클론 (코드스페이스 사용 시 스킵)
git clone https://github.com/eunjison/Azure-AI-Agent-MAF.git
cd Azure-AI-Agent-MAF

# 2. uv 설치
curl -Ls https://astral.sh/uv/install.sh | bash

# 3. 의존성 동기화 및 가상환경 생성
uv sync

# 4. 가상환경 활성화 (선택)
source .venv/bin/activate  # Windows: .venv\Scripts\activate

# 5. 환경변수 설정
cp .env.sample .env
# .env 파일에 Azure OpenAI 정보 입력

# 6. Azure 인증
az login
```
### 3️⃣ Azure OpenAI 설정
`.env` 파일에 다음 정보를 입력하세요:
```env
# Azure OpenAI 설정
AZURE_OPENAI_ENDPOINT=https://your-resource.cognitiveservices.azure.com/
AZURE_OPENAI_DEPLOYMENT_NAME=your-deployment-name
AZURE_OPENAI_MODEL=your-model-name
AZURE_OPENAI_API_VERSION=2025-04-01-preview

# 선택적 API 키
SERP_API_KEY=your-serpapi-key  
OPENWEATHER_API_KEY=your-openweather-api-key
GOOGLE_API_KEY=your-google-api-key
EXCHANGE_RATE_API_KEY=your-exchange-rate-api-key
```

Azure OpenAI 인증은 `DefaultAzureCredential`만 사용합니다.
이 워크숍의 노트북은 Azure OpenAI에 대해 API Key 인증을 사용하지 않습니다. `AZURE_OPENAI_API_KEY`를 설정하거나 코드에서 `api_key=`를 사용하는 방식은 금지합니다.

노트북 실행 전 반드시 Azure CLI 로그인 상태를 준비하세요.

```bash
az login
```

### 4️⃣ GitHub Codespaces 사용

이 저장소는 GitHub Codespaces용 개발 컨테이너 설정을 포함합니다.
Codespace를 생성하면 Python, Jupyter, Azure CLI가 포함된 환경이 준비되고 `uv sync`가 자동으로 실행됩니다.

**Codespaces 사용 순서:**
1. GitHub에서 이 저장소를 연 뒤 **Code > Codespaces > Create codespace on main** 선택
2. 컨테이너 초기화 완료 대기
3. `.env` 파일에 Azure OpenAI 설정 입력
4. Codespaces 터미널에서 아래 명령 실행

```bash
az login
```

5. Jupyter 커널로 `Python (Azure-AI-Agent-MAF)` 선택 후 노트북 실행

Codespaces에서도 Azure OpenAI 인증은 `DefaultAzureCredential`만 사용합니다. `AZURE_OPENAI_API_KEY` 또는 `api_key=` 방식은 사용하지 않습니다.
---

## 📚 실습 노트북 가이드

### 🔰 기초 과정 (Basic Agents)
| 노트북 | 제목 | 학습 내용 | 난이도 | 상태 |
|--------|------|-----------|------|------|
| `01_Basic_Agent.ipynb` | 기본 ChatAgent | ChatAgent를 사용한 단일 에이전트 구현 | ⭐⭐ | ✅ 완성 |
| `02_Orchestrations.ipynb` | 멀티 에이전트 오케스트레이션 | Sequential, Concurrent, Handoff 패턴 | ⭐⭐⭐ | ✅ 완성 |
| `03_Workflow.ipynb` | 워크플로우 | Graph-based 워크플로우, 조건부 라우팅, 병렬 처리, 체크포인팅 | ⭐⭐⭐ | ✅ 완성 |

### 🔧 중급 과정 (Advanced Features)
| 노트북 | 제목 | 학습 내용 | 난이도 | 상태 |
|--------|------|-----------|------|------|
| `04_Research.ipynb` | 연구 에이전트 | 웹 검색 기반 정보 수집 및 분석 | ⭐⭐⭐⭐ | ✅ 완성 |
| `05_Code_Interpreter.ipynb` | 코드 인터프리터 | AI 코드 생성 및 실행, 데이터 분석 자동화 | ⭐⭐⭐⭐ | ✅ 완성 |

### 🚀 고급 과정 (Enterprise Systems)  
| 노트북 | 제목 | 학습 내용 | 난이도 | 상태 |
|--------|------|-----------|------|------|
| `06_Enterprise.ipynb` | 엔터프라이즈 시스템 | 대규모 멀티 에이전트 플랫폼 | ⭐⭐⭐⭐⭐ | ✅ 완성 |

### 📋 학습 경로 추천

**🎯 초급자 (Agent Framework 입문):**
1. `01_Basic_Agent.ipynb` - 기본 개념 학습
2. `02_Orchestrations.ipynb` - 멀티 에이전트 오케스트레이션
3. `04_Research.ipynb` - 실제 데이터 활용

**🚀 중급자 (실무 응용):**
1. `03_Workflow.ipynb` - 워크플로우 오케스트레이션
2. `05_Code_Interpreter.ipynb` - 코드 인터프리터
3. `06_Enterprise.ipynb` - 엔터프라이즈급 시스템

---

## 🎯 주요 기능 및 예제

### 🤖 기본 ChatAgent (`03_Basic_Agent_MAF.ipynb`)
```python
import asyncio
from agent_framework import ChatAgent
from agent_framework.azure import AzureOpenAIChatClient
from azure.identity import AzureCliCredential

# ChatAgent 생성
agent = AzureOpenAIChatClient(
    credential=AzureCliCredential()
).as_agent(
    instructions="You are a helpful assistant.",
    name="Assistant"
)

# 실행
async def main():
    result = await agent.run("What is AI?")
    print(result.text)

asyncio.run(main())
```

### 🔧 도구 통합 ChatAgent
```python
from typing import Annotated
from pydantic import Field

def get_weather(
    location: Annotated[str, Field(description="The location")]
) -> str:
    """Get weather for a location."""
    return f"Weather in {location}: Sunny, 25°C"

agent = ChatAgent(
    chat_client=AzureOpenAIChatClient(credential=AzureCliCredential()),
    instructions="You are a helpful assistant with weather access.",
    tools=[get_weather]
)

result = await agent.run("What's the weather in Seoul?")
```

### 🌊 스트리밍 응답
```python
async def stream_demo():
    async for chunk in agent.run_stream("Tell me a story"):
        print(chunk.text, end="", flush=True)

asyncio.run(stream_demo())
```

### 🔄 워크플로우 기반 오케스트레이션 (`03_Workflow.ipynb`)
```python
from agent_framework import WorkflowBuilder

# 순차적 워크플로우
builder = WorkflowBuilder()
builder.register_agent(lambda: preprocessor, name="preprocess")
builder.register_agent(lambda: analyzer, name="analyze")
builder.register_agent(lambda: reporter, name="report")

builder.add_edge("preprocess", "analyze")
builder.add_edge("analyze", "report")
builder.set_start_executor("preprocess")

workflow = builder.build()

# 실행
async for event in workflow.run_stream("Analyze cloud computing trends"):
    print(event)
```

### ⚙️ 고급 워크플로우 패턴

**조건부 라우팅:**
```python
# 입력에 따라 다른 에이전트로 라우팅
builder.add_edge(classifier, technical_analyst, 
                condition=lambda msg: "technical" in str(msg).lower())
builder.add_edge(classifier, business_analyst,
                condition=lambda msg: "business" in str(msg).lower())
```

**병렬 처리:**
```python
# 여러 에이전트가 동시에 입력을 받음
builder.add_fan_out_edges("technical", ["business", "market"])
```

**체크포인팅:**
```python
from agent_framework import FileCheckpointStorage

checkpoint_storage = FileCheckpointStorage("./checkpoints")
builder.with_checkpointing(checkpoint_storage)
```

### 💻 AI 코드 인터프리터 (`05_Code_Interpreter.ipynb`)
```python
from agent_framework import ChatAgent
from agent_framework.azure import AzureOpenAIChatClient

# Code Interpreter Agent
agent = ChatAgent(
    chat_client=AzureOpenAIChatClient(credential=AzureCliCredential()),
    instructions="You are a Python coding expert. Generate and explain code.",
    name="CodeInterpreter"
)

# 코드 생성 및 실행
result = await agent.run("Calculate first 10 Fibonacci numbers")
print(result.text)  # 생성된 Python 코드 포함
```

**코드 추출 및 실행:**
```python
def extract_python_code_from_response(response_text: str) -> list[str]:
    """응답에서 Python 코드 블록 추출"""
    pattern = r'```python\n(.*?)\n```'
    return re.findall(pattern, response_text, re.DOTALL)

# 응답에서 코드 추출 및 실행
code_blocks = extract_python_code_from_response(result.text)
for code in code_blocks:
    output = execute_generated_code(code)
    print(output)
```

---

## 📁 프로젝트 구조

```
Azure-AI-Agent-MAF/
├── 📋 README.md                       # 프로젝트 가이드 (이 파일)
├── ⚙️ pyproject.toml                 # 패키지 의존성 및 프로젝트 설정
├── 🔒 uv.lock                         # uv 잠금 파일
├── 🔐 .env.sample                    # 환경변수 샘플 파일
├── 🔐 .env                            # 환경변수 (Azure OpenAI 설정, Git 무시)
├── 📓 01_Basic_Agent.ipynb            # 기본 ChatAgent 실습
├── 📓 02_Orchestrations.ipynb         # 멀티 에이전트 오케스트레이션
├── 📓 03_Workflow.ipynb               # 워크플로우 실습
├── 📓 04_Research.ipynb               # 리서치 에이전트 실습
├── 📓 05_Code_Interpreter.ipynb       # 코드 인터프리터 실습
└── 📓 06_Enterprise.ipynb             # 엔터프라이즈 멀티 에이전트 실습
```

---

## 🔄 AutoGen에서 Microsoft Agent Framework로의 마이그레이션

### 주요 변경사항

#### 1. 패키지 Import
**AutoGen:**
```python
from autogen_agentchat.agents import AssistantAgent
from autogen_agentchat.teams import RoundRobinGroupChat
```

**Microsoft Agent Framework:**
```python
from agent_framework import ChatAgent
from agent_framework.azure import AzureOpenAIChatClient
```

#### 2. 에이전트 생성
**AutoGen:**
```python
agent = AssistantAgent(
    name="assistant",
    model_client=model_client,
    system_message="You are helpful."
)
```

**Microsoft Agent Framework:**
```python
agent = ChatAgent(
    chat_client=AzureOpenAIChatClient(credential=AzureCliCredential()),
    instructions="You are helpful.",
    name="assistant"
)
```

#### 3. 워크플로우 정의
**AutoGen:**
```python
from autogen_agentchat.teams import RoundRobinGroupChat

team = RoundRobinGroupChat([agent1, agent2])
result = await team.run(task="Hello")
```

**Microsoft Agent Framework:**
```python
from agent_framework import WorkflowBuilder

builder = WorkflowBuilder()
builder.register_agent(lambda: agent1, name="agent1")
builder.register_agent(lambda: agent2, name="agent2")
builder.add_edge("agent1", "agent2")

workflow = builder.build()
async for event in workflow.run_stream("Hello"):
    print(event)
```

---

## 🚀 빠른 시작 가이드

### 1️⃣ 첫 번째 에이전트 실행 (5분)
```bash
# VS Code에서 Jupyter 노트북 열기
code notebooks/01_Basic_Agent.ipynb
```
- 커널을 "Python 3.10+"로 선택
- 모든 셀을 순차적으로 실행
- Azure OpenAI 연결 및 기본 대화 테스트

### 2️⃣ 워크플로우 기반 오케스트레이션 (15분)
```bash
code notebooks/03_Workflow.ipynb
```
- Graph-based 워크플로우 구현
- 조건부 라우팅 및 병렬 처리
- 체크포인팅을 통한 상태 관리

### 3️⃣ 코드 인터프리터 에이전트 (15분)
```bash
code notebooks/05_Code_Interpreter.ipynb
```
- AI가 Python 코드 생성
- 데이터 분석 및 수학 계산 자동화
- 코드 추출 및 실행

---

## 🛡️ 보안 및 모범 사례

### 🔐 인증 정책
- ✅ `.env` 파일에 Azure OpenAI 설정 저장 (Git에 커밋 금지)
- ✅ `python-dotenv`로 환경변수 로드
- ✅ `az login` 후 `DefaultAzureCredential` 사용
- ❌ Azure OpenAI에 `AZURE_OPENAI_API_KEY` 사용 금지
- ❌ 코드에 `api_key=` 전달 금지
- ❌ 코드에 직접 API 키 하드코딩 금지

### ✅ 구현 상태 확인

**완성된 기능:**
- ✅ 기본 ChatAgent 구현 (01_Basic_Agent.ipynb)
- ✅ 멀티 에이전트 오케스트레이션 패턴 (02_Orchestrations.ipynb)
- ✅ Graph-based 워크플로우 (03_Workflow.ipynb)
  - 순차적 실행 (Sequential Flow)
  - 조건부 라우팅 (Conditional Routing)
  - 병렬 처리 (Parallel Processing)
  - 체크포인팅 (Checkpointing & State Management)
- ✅ Research 에이전트 (04_Research.ipynb)
  - 웹 검색 기반 정보 수집
  - 다중 도구 통합
  - 시장 분석 및 기술 분석
- ✅ Code Interpreter 에이전트 (05_Code_Interpreter.ipynb)
  - Python 코드 생성
  - 코드 추출 및 실행
  - 데이터 분석 자동화
- ✅ Enterprise 멀티 에이전트 시스템 (06_Enterprise.ipynb)
  - 고객 서비스 자동화
  - 성능 모니터링
  - 탄력적 워크플로우

### 🚦 레이트 리밋 관리
- Azure OpenAI 사용량 모니터링
- 적절한 지연 시간 설정
- 에러 핸들링 및 재시도 로직 구현

---

## 🔧 트러블슈팅

### 🚨 자주 발생하는 문제 및 해결방법

#### 1️⃣ 패키지 설치 오류
```bash
# 해결방법 1: 잠금 파일 기준으로 환경 다시 동기화
uv sync --refresh

# 해결방법 2: 캐시 정리 후 재동기화
uv cache clean
uv sync

# 해결방법 3: 가상환경 재생성
rm -rf .venv
uv sync
```

#### 2️⃣ Azure 인증 오류
```bash
# DefaultAzureCredential 사용 전 Azure CLI 로그인 필수
az login

# 올바른 구독 선택
az account set --subscription "your-subscription-id"
```

API Key 방식은 지원하지 않으므로 `AZURE_OPENAI_API_KEY`를 추가해서 해결하려고 하면 안 됩니다.

#### 3️⃣ 환경변수 확인
```python
import os
from dotenv import load_dotenv
load_dotenv()

print("Endpoint:", os.getenv("AZURE_OPENAI_ENDPOINT"))
print("Deployment:", os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME"))
print("API Version:", os.getenv("AZURE_OPENAI_API_VERSION"))
```

#### 4️⃣ pyproject.toml 설치 오류
```bash
# lock 파일과 pyproject.toml이 어긋난 경우
uv lock
uv sync

# 사전 릴리스 패키지 확인이 필요한 경우
uv sync --refresh --prerelease allow
```

---

## 📊 워크플로우 구현 상세 가이드

### WorkflowBuilder API

| 메서드 | 설명 | 사용 예시 |
|--------|------|----------|
| `register_agent()` | 에이전트 등록 (권장) | `builder.register_agent(lambda: agent, name="agent_name")` |
| `add_agent()` | 에이전트 직접 추가 | `builder.add_agent(agent)` |
| `add_edge()` | 에이전트 간 연결 | `builder.add_edge("source", "target")` |
| `add_edge()` with condition | 조건부 라우팅 | `builder.add_edge(a, b, condition=lambda msg: ...)` |
| `add_fan_out_edges()` | 1개 → 다수 병렬 | `builder.add_fan_out_edges("source", ["t1", "t2"])` |
| `add_fan_in_edges()` | 다수 → 1개 수렴 | `builder.add_fan_in_edges(["s1", "s2"], "target")` |
| `set_start_executor()` | 시작점 설정 | `builder.set_start_executor("agent_name")` |
| `with_checkpointing()` | 체크포인팅 활성화 | `builder.with_checkpointing(storage)` |
| `build()` | 워크플로우 생성 | `workflow = builder.build()` |

### 워크플로우 실행

```python
# 스트리밍 실행 (권장)
async for event in workflow.run_stream(input_data):
    print(f"Event: {event}")

# 일괄 실행
result = await workflow.run(input_data)
print(result)
```

---

**🎉 Happy Agent Building with Microsoft Agent Framework! 🤖**
