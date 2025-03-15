# encoding: utf-8
# frozen_string_literal: true

# Redmine Page Styler - A plugin for customizing CSS of specific Redmine pages
# Copyright (C) 2025 #Sylv!a
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

require 'redmine'

Redmine::Plugin.register :redmine_page_styler do
  name 'Redmine Page Styler'
  author '#Sylv!a'
  description 'Allows customizing CSS for specific Redmine pages'
  version '1.0.0'
  url 'https://github.com/imsylviaymc/redmine_page_styler'
  author_url 'https://github.com/imsylviaymc'
  
  # 擴充套件需要 Redmine 5.0.0 或更高版本
  requires_redmine version_or_higher: '5.0.0'
  
  # 擴充套件設置
  settings default: {
    'css_rules' => []
  }, partial: 'settings/page_styler'
  
  # 添加擴充套件的權限
  permission :manage_page_styles, { page_styler: [:index, :new, :create, :edit, :update, :delete] }, require: :admin
  
  # 添加擴充套件到管理選單
  menu :admin_menu, :page_styler, 
    { controller: 'page_styler', action: 'index' },
    caption: :label_page_styler,
    html: { class: 'icon icon-package' }
end

# 加載擴充套件的庫文件
require_relative 'lib/redmine_page_styler'
