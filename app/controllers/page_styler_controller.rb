# encoding: utf-8
# frozen_string_literal: true

# Redmine Page Styler - A plugin for customizing CSS of specific Redmine pages
# Copyright (C) 2025 #Sylv!a

class PageStylerController < ApplicationController
  layout 'admin'
  
  before_action :require_admin
  before_action :find_style, only: [:edit, :update, :destroy]
  
  def index
    @css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
  end
  
  def new
    @css_rule = {
      'id' => SecureRandom.uuid,
      'name' => '',
      'css' => '',
      'enabled' => '1'
    }
  end
  
  def create
    # 使用強參數過濾 css_rule 參數
    @css_rule = params.require(:css_rule).permit(:name, :css, :enabled).to_h
    @css_rule['id'] = SecureRandom.uuid
    
    # 如果沒有提供 enabled 參數，預設為啟用
    @css_rule['enabled'] = '1' if @css_rule['enabled'].nil?
    
    css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
    css_rules << @css_rule
    
    if update_plugin_settings(css_rules)
      flash[:notice] = l(:notice_successful_create)
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    # 使用強參數過濾 css_rule 參數
    css_rule_params = params.require(:css_rule).permit(:name, :css, :enabled)
    @css_rule.merge!(css_rule_params)
    
    css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
    css_rules.map! { |rule| rule['id'] == @css_rule['id'] ? @css_rule : rule }
    
    if update_plugin_settings(css_rules)
      flash[:notice] = l(:notice_successful_update)
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
    css_rules.reject! { |rule| rule['id'] == @css_rule['id'] }
    
    if update_plugin_settings(css_rules)
      flash[:notice] = l(:notice_successful_delete)
    else
      flash[:error] = l(:error_failed_to_delete)
    end
    
    redirect_to action: 'index'
  end
  
  def help
    # 顯示幫助頁面
    render 'help'
  end
  
  private
  
  def find_style
    css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
    @css_rule = css_rules.find { |rule| rule['id'] == params[:id] }
    render_404 unless @css_rule
  end
  
  def update_plugin_settings(css_rules)
    settings = Setting.plugin_redmine_page_styler.dup
    settings['css_rules'] = css_rules
    Setting.plugin_redmine_page_styler = settings
    true
  rescue => e
    Rails.logger.error "Error updating Page Styler settings: #{e.message}"
    false
  end
end
