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
