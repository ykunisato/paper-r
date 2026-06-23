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

- **LLM向けRパッケージ**: [`ellmer`](https://ellmer.tidyverse.org/)（RからLLMのAPIを呼び出す），[`gander`](https://github.com/simonpcouch/gander)・[`chores`](https://github.com/simonpcouch/chores)（AI支援コーディングのRStudioアドイン），[`btw`](https://github.com/posit-dev/btw)，`usethis` をインストールしています。

### APIキーの設定

これらのツールを使うには，ご自身のAPIキーを `~/.Renviron` に設定してください。

1. Rで以下を実行してファイルを開きます。

   ```r
   usethis::edit_r_environ()
   ```

2. 自分のキー（ここではGroq）の行を追加して保存します。

   ```
   GROQ_API_KEY="gsk_xxxxxxxxxxxx"
   ```

3. Rを再起動します。

本イメージの `Rprofile.site` は，**`GROQ_API_KEY` が設定されていると `gander` がGroqの `llama-3.3-70b-versatile` モデルを自動で使う**ように設定されています。

```r
if (nzchar(Sys.getenv("GROQ_API_KEY"))) {
  options(
    gander.chat = ellmer::chat_groq(
      model = "llama-3.3-70b-versatile"
    )
  )
}
```

### Groqのモデルを変更する

Groq内で別のモデルを使うには，`model = "..."` の値を変えます。イメージを作り直さずにユーザーごとに上書きするには，自分の `~/.Rprofile`（`usethis::edit_r_profile()` で開く）に以下を追記してRを再起動してください。

```r
if (nzchar(Sys.getenv("GROQ_API_KEY"))) {
  options(
    gander.chat = ellmer::chat_groq(
      model = "openai/gpt-oss-120b"   # 使いたいモデルを指定
    )
  )
}
```

Groqで現在使えるモデルは，以下で確認できます。

```bash
curl https://api.groq.com/openai/v1/models -H "Authorization: Bearer $GROQ_API_KEY"
```

または公式の一覧 [console.groq.com/docs/models](https://console.groq.com/docs/models) を参照してください。Groqは提供モデルを頻繁に更新するため，最新で高性能なモデルはここで確認するのが確実です。

> イメージ全体のデフォルトを変えたい場合は，`Dockerfile` の `Rprofile.site` のブロックを書き換えてリビルドしてください。

別のプロバイダ自体を使う場合は，対応するAPIキー（例: `OPENAI_API_KEY`，`ANTHROPIC_API_KEY`）を設定し，`ellmer`（`chat_openai()`，`chat_anthropic()` など）を適宜設定してください。
