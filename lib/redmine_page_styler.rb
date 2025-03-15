# encoding: utf-8
# frozen_string_literal: true

# Redmine Page Styler - A plugin for customizing CSS of specific Redmine pages
# Copyright (C) 2025 #Sylv!a

# 定義擴充套件的命名空間
module RedminePageStyler
  # 這個模組會被 Zeitwerk 自動加載
  # 它作為擴充套件的命名空間
end

# 加載擴充套件的鉤子和控制器
require_relative 'redmine_page_styler/hooks'
require_relative 'redmine_page_styler/patches'
