# Redmine Page Styler

## 概述

Redmine Page Styler 是一個 Redmine 擴充套件，允許管理員為特定頁面、ID、Class 等，額外自定義 CSS 樣式來進行 Redmine 的UI外觀微調。

## 功能

- 為指定 css class, id 額外添加、調整自定義 CSS 樣式
- 具備 CSS 常用屬性快速插入功能
- 目前支援英文、繁體中文

## 要求

- Redmine 5.0.0 或更高版本

## 安裝

1. 下載或 clone 此擴充套件到 Redmine 的 plugins 目錄：

```bash
cd {REDMINE_ROOT}/plugins
git clone https://github.com/imsylviaymc/redmine_page_styler.git
```

2. 重新啟動 Redmine 服務器

## 使用方法

1. 以管理員身份登入 Redmine
2. 前往「網站管理」>「頁面樣式設計器」
3. 點擊「新增樣式」創建新的 CSS 樣式規則


## 範例

### 修改問題列表的表格樣式

```css
/* 修改問題列表表格的樣式 */
table.list.issues {
  border: 1px solid #ddd;
  border-collapse: collapse;
}

table.list.issues th {
  background-color: #f5f5f5;
  color: #333;
  font-weight: bold;
}

table.list.issues tr:hover {
  background-color: #f9f9f9;
}
```

### 自定義專案概覽頁面

```css
/* 自定義專案概覽頁面 */
div.projects h3 {
  color: #3e4f59;
  border-bottom: 2px solid #e0e0e0;
  padding-bottom: 5px;
}

div.projects .wiki h1 {
  font-size: 24px;
  color: #2996cc;
}
```

## 授權

此插件基於 GNU General Public License v3.0 發布。

## 作者

- #Sylv!a
- https://medium.com/@imsylviaymc

## 貢獻

歡迎提交 Pull Requests 和 Issues 來改進此擴充套件。
