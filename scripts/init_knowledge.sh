#!/usr/bin/env bash
set -e

ROOT="knowledge"
mkdir -p "$ROOT"/{programming_languages,software_architecture,ai_ml,encyclopedias,code_snippets,patterns,glossaries}

# لغات أساسية (أضف/عدّل لاحقًا)
LANGS=(python javascript typescript cpp java csharp go rust kotlin swift php ruby dart lua r matlab scala haskell elixir erlang julia solidity zig shell)

for L in "${LANGS[@]}"; do
  mkdir -p "$ROOT/programming_languages/$L"/{stdlib,libraries/{web,data,ml,nlp,vision,audio,system,utils},snippets}
  cat > "$ROOT/programming_languages/$L/_manifest.yaml" <<EOF
title: "$L Knowledge Pack"
lang: en
tags: [language, $L]
sections: [overview, syntax, stdlib, libraries, patterns, tooling, performance, snippets]
EOF
  touch "$ROOT/programming_languages/$L"/{overview.md,syntax.md,patterns.md,tooling.md,performance.md}
done

# هندسة البرمجيات
mkdir -p "$ROOT/software_architecture"/{system_design,distributed_systems,databases,devops_platform,diagrams}
cat > "$ROOT/software_architecture/_manifest.yaml" <<EOF
title: "Software Architecture"
sections: [system_design, distributed_systems, databases, devops_platform, diagrams]
EOF

# AI/ML
mkdir -p "$ROOT/ai_ml"/{foundations,nlp,vision,audio_speech,rl,model_ops,datasets_prep,code}
cat > "$ROOT/ai_ml/_manifest.yaml" <<EOF
title: "AI & ML Knowledge"
sections: [foundations, nlp, vision, audio_speech, rl, model_ops, datasets_prep, code]
EOF
touch "$ROOT/ai_ml/foundations/glossary_core.yaml"

# معاجم
cat > "$ROOT/glossaries/glossary_ai_ar_en.json" <<'EOF'
{
  "transformer": {"ar": "محول", "en": "Transformer", "desc_ar": "بنية تعتمد الانتباه", "desc_en": "Attention-based architecture"}
}
EOF

# أمثلة موسوعية
cat > "$ROOT/encyclopedias/os_concepts.md" <<EOF
---
title: "Operating Systems – Concepts"
lang: en
---
- Processes vs Threads
- Scheduling basics
- Memory management
EOF

# أمثلة مخططات
cat > "$ROOT/software_architecture/diagrams/microservices.mmd" <<'EOF'
flowchart LR
  A[API Gateway] --> B[Auth Service]
  A --> C[Orders Service]
  C --> D[DB - Orders]
  A --> E[Inventory Service]
  E --> F[DB - Inventory]
  C -- events --> E
EOF

echo "knowledge/ structure initialized."
