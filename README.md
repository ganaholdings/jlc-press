# Joker's Last Call — Official Site &amp; Press Kit

Static site. No build step. Serve the folder as-is.

**Live URL (once Pages is enabled):** `https://ganaholdings.github.io/jlc-press/`

---

## GitHub Pages 배포

1. `ganaholdings` 조직에 `jlc-press` 리포지토리 생성 (Public)
2. **`bash build_downloads.sh` 를 먼저 실행한다** (아래 참조)
3. 이 폴더의 **내용물 전체**를 리포지토리 루트에 커밋
4. Settings → Pages → Source: `Deploy from a branch` → Branch: `main` / `(root)` → Save
5. 1~2분 후 `https://ganaholdings.github.io/jlc-press/` 접속 확인

```bash
git init
git add .
git commit -m "chore: press kit v1.0"
git branch -M main
git remote add origin https://github.com/ganaholdings/jlc-press.git
git push -u origin main
```

### 다운로드 ZIP 생성 (커밋 전 1회)

`downloads/` 폴더는 비어 있다. 페이지의 다운로드 버튼이 가리키는 ZIP 4종은 아래 명령으로 만든다.

```bash
cd jlc-press
bash build_downloads.sh
```

`assets/` 를 읽어 `downloads/` 에 4개 파일을 생성한다. 자산을 교체할 때마다 다시 실행하면 된다.

| 파일 | 크기 |
| :--- | :--- |
| `JLC_PressKit_Full.zip` | 약 70 MB |
| `JLC_Screenshots.zip` | 약 42 MB |
| `JLC_Motion.zip` | 약 15 MB |
| `JLC_KeyArt_Logo.zip` | 약 13 MB |

> 리포지토리 총 용량은 약 210 MB가 된다. GitHub 파일당 한도(100 MB)와 Pages 사이트 한도(1 GB) 내이므로 Git LFS 없이 그대로 커밋된다.

---

## 배포 후 할 일

| # | 작업 | 위치 |
| :-- | :--- | :--- |
| 1 | Steamworks → Store Page → **Visit the website** URL을 이 주소로 변경 | Steamworks |
| 2 | 회사 홈페이지(`fullform.page`)에 JLC 카드 + 이 페이지 링크 추가 | Google Sites |
| 3 | 프레스킷 URL을 아웃리치 메일 템플릿에 삽입 | 키 배포 |

---

## 폴더 구조

```
index.html                  단일 파일 사이트 (EN 기본 / KO 토글)
README.md                   이 문서
assets/
  keyart/                   키아트 원본 · 캡슐 · 라이브러리 히어로
  logo/                     로고 PNG(알파) · 아이콘 256/1024
  motion/                   MP4 4 + GIF 4 (720p)
  shots/en|ko|zh/           스크린샷 원본 1920×1080 PNG
  web/                      페이지 표시용 경량 JPG (다운로드용 아님)
  dev/                      개발자 사진 (명찰 블러 처리본)
build_downloads.sh          배포용 ZIP 4종 생성 스크립트
downloads/                  build_downloads.sh 실행 시 채워짐
  JLC_PressKit_Full.zip     전체
  JLC_Screenshots.zip       스크린샷 18장
  JLC_Motion.zip            MP4 + GIF
  JLC_KeyArt_Logo.zip       키아트 · 로고 · 아이콘
```

---

## 자산 출처 및 주의사항

- **모션 클립 4종과 영어 스크린샷 5장은 `battle_60s` / `onecard_lastcall` 캡처 영상에서 프레임·구간을 뽑은 것이다.** 원본 raw 캡처에 있던 `DBG` 디버그 오버레이를 피하기 위한 조치이며, 화질 손실 없이 1920×1080 PNG로 저장되어 있다.
- **연출 이펙트 구간은 의도적으로 배제했다.** b-roll 레코더는 `[JLC VIDEO BROLL]` 로그로 특정 이펙트를 강제 주입하는데(15초·35초·50초 지점, 그리고 `joker_reflect` / `mass_draw` / `chain_buildup` 클립 전반), 실제 플레이에서 재현되지 않는 장면이므로 모두 컷했다. 현재 수록된 4장면 중 3장면(`01_joker`, `02_king_streak`, `03_ace_chain`)은 `console.log`로 검증된 100% 실제 플레이다.
- **개발자 사진**은 명찰과 어깨 로고를 가우시안 블러 처리했다. 원본은 리포지토리에 포함하지 않는다.
- **한국어 `06_battle_koreana.png`** 는 정적 PNG가 아니라 5프레임 APNG여서 스크린샷 세트에서 제외했다.

## 알려진 개선 예정 (v1.1)

| 항목 | 대상 파일 | 상태 |
| :--- | :--- | :--- |
| 맵 화면 유물 슬롯이 빈 `RELICS` 플레이스홀더 | `07_map_en.png` | 유물 3개 보유 상태로 재캡처 예정 |
| 보스전 `BOSS RULE` 배너 텍스트 누락 | `05_boss_battle_en.png` | 로컬라이제이션 수정 후 재캡처 |
| 맵 화면 `TAP TO START` (PC 빌드인데 모바일 문구) | `07_map_en.png` | 빌드 수정 후 재캡처 |
| 조커 **반사** 장면 부재 | 모션 세트 | 실제 플레이에서 조커 반사가 나온 클립 확보 후 추가 |
| 한국어·중국어 모션 클립 | 모션 세트 | 현재 영어만. 국내 매체용 KO 클립 추가 검토 |

---

*Press kit v1.1 — 2026-08-05*
