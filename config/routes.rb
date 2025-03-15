# encoding: utf-8
# frozen_string_literal: true

# Redmine Page Styler - A plugin for customizing CSS of specific Redmine pages
# Copyright (C) 2025 #Sylv!a

RedmineApp::Application.routes.draw do
  # 擴充套件的路由配置
  get '/page_styler', to: 'page_styler#index'
  get '/page_styler/new', to: 'page_styler#new'
  post '/page_styler/create', to: 'page_styler#create'
  get '/page_styler/edit/:id', to: 'page_styler#edit', as: 'page_styler_edit'
  put '/page_styler/update/:id', to: 'page_styler#update', as: 'page_styler_update'
  delete '/page_styler/destroy/:id', to: 'page_styler#destroy', as: 'page_styler_destroy'
  get '/page_styler/help', to: 'page_styler#help', as: 'page_styler_help'
end
