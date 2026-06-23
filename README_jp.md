# Dockerfile of writing paper by R Markdown

これは，RstudioでR Markdownを用いて論文執筆を行う際に便利なパッケージやアドインを含めたDockerファイルのリポジトリです。本Dockerファイルは，rocker/verseをベースにしています。

作成者は専修大学人間科学部心理学科の国里愛彦です (ykunisato@psy.senshu-u.ac.jp)。エラーや追加してほしいパッケージなどがありましたら，気軽にご連絡ください。

Keywords: 心理学, 認知モデリング，心理学的ネットワーク分析，メタ分析，論文執筆，rstudio, rmarkdown, stan

## 使用法

Docker Desktopがインストールされていて，ある程度の通信速度があれば，数分で使用可能です。

1.Docker Desktop ( https://www.docker.com/products/docker-desktop )をインストールする。

2.ターミナル（Macの場合。Winはコマンドプロンプト？)を開く

3.ターミナルに以下を打ち込んで、コンテナーをrunする(runの前にPullが自動的なされます)。パスワードとコンテナ名はご自身の好きなように設定ください。

**Mac**

```
docker run -e PASSWORD=パスワード -p 8787:8787 -v $(pwd):/home/rstudio -d --name paperr ykunisato/paper-r
```


**Windows**


```
docker run -e PASSWORD=パスワード -p 8787:8787 -v "%cd%":/home/rstudio -d --name paperr ykunisato/paper-r
```


4.ブラウザを開いて，urlバー（アドレスバー）に，http://localhost:8787/ とタイプする

5.ブラウザ上にRstudioが出てくるので，IDにrstudio，パスに上記で設定したパスワードをいれる。

## [インストールされているRパッケージのリスト](https://github.com/ykunisato/paper-r/blob/master/list_packages.md)

## AIアシスタント関連ツール

Rパッケージに加えて，コーディングや執筆をAIアシスタントで支援するためのツールも同梱しています。

- **[opencode](https://github.com/anomalyco/opencode)**: ターミナルから使えるAIコーディングエージェントです。RStudioの「Terminal」タブで `opencode` と打つと起動します。
- **LLM向けRパッケージ**: [`ellmer`](https://ellmer.tidyverse.org/)（RからLLMのAPIを呼び出す），[`gander`](https://github.com/simonpcouch/gander)・[`chores`](https://github.com/simonpcouch/chores)（AI支援コーディングのRStudioアドイン），[`btw`](https://github.com/posit-dev/btw)，`usethis` をインストールしています。

これらを使うには，ご自身のAPIキーを `~/.Renviron` に設定してください（例: `usethis::edit_r_environ()` で開き，`GROQ_API_KEY="gsk_xxxxxxxx"` のような行を追加してRを再起動）。`GROQ_API_KEY` が設定されていると，`gander` はGroqの `llama-3.3-70b-versatile` モデルを使うよう自動で設定されます。
