# AI 학습 일지

[Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) 테마로 만든 GitHub Pages 블로그입니다. AI를 공부하며 배운 내용과 시행착오를 기록합니다.

- 블로그 주소: https://jeon-daejin.github.io/blog/
- 글 작성: `_posts/YYYY-MM-DD-제목.md` 형식으로 파일을 추가하면 됩니다.

## 카테고리

이 블로그는 다음 3개 카테고리로 운영합니다.

- **AI 개념정리** — 강의/책/논문에서 정리한 개념
- **개발 기록** — 실습, 프로젝트, 에러/트러블슈팅
- **회고** — 주간/월간 회고, 계획, 생각

## 새 글 작성하기

### 1) PC에서

```shell
bash tools/new_post.sh
```

제목·카테고리·태그·요약을 물어보면 `_posts/`에 템플릿이 채워진 새 글 파일이 생성됩니다.
본문을 작성한 뒤 커밋 → (검토 후) push 하면 게시됩니다.

### 2) 모바일/어디서나

GitHub 앱이나 모바일 브라우저에서 이 저장소의 **Issues → New issue → "📝 새 블로그 글"** 템플릿을 선택해
제목/카테고리/태그/요약/본문을 채워 등록하면, GitHub Actions가 자동으로 포스트를 만들어 커밋·게시합니다.

> ⚠️ 이슈를 등록하는 즉시 자동으로 커밋되어 배포까지 진행됩니다(별도 검토 단계 없음).
> 이 자동화가 동작하려면 저장소 Settings → Actions → General → Workflow permissions에서
> **"Read and write permissions"**가 켜져 있어야 합니다(최초 1회 설정).

## 로컬에서 미리보기 (선택)

Ruby가 설치되어 있다면 아래 명령으로 로컬 서버를 띄워 미리 볼 수 있습니다.

```shell
bundle install
bundle exec jekyll serve
```

## 배포

`main` 브랜치에 push하면 GitHub Actions가 자동으로 빌드하여 GitHub Pages에 배포합니다.
