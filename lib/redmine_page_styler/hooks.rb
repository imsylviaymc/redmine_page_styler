# encoding: utf-8
# frozen_string_literal: true

# Redmine Page Styler - A plugin for customizing CSS of specific Redmine pages
# Copyright (C) 2025 #Sylv!a

module RedminePageStyler
  # u5b9au7fa9u63d2u4ef6u7684u9264u5b50u985e
  class Hooks < Redmine::Hook::ViewListener
    # u5728 HTML u982du90e8u6ce8u5165u81eau5b9au7fa9 CSS
    def view_layouts_base_html_head(context)
      # u7372u53d6u7576u524du8acbu6c42u7684u63a7u5236u5668u548cu52d5u4f5c
      controller = context[:controller]
      action = controller.action_name
      controller_name = controller.controller_name
      request_path = controller.request.path
      
      # u5f9eu8a2du7f6eu4e2du7372u53d6 CSS u898fu5247
      css_rules = Setting.plugin_redmine_page_styler['css_rules'] || []
      
      # u6dfbu52a0u8abfu8a66u4fe1u606f
      Rails.logger.info "PageStyler: Processing CSS rules, found #{css_rules.size} rules in settings: #{css_rules.map { |r| r['name'] }.join(', ')}"
      
      # u7be9u9078u9069u7528u65bcu7576u524du9801u9762u7684 CSS u898fu5247
      applicable_rules = css_rules.select do |rule|
        # u8df3u904eu672au555fu7528u7684u898fu5247
        rule['enabled'] != '0'
      end
      
      # u5982u679cu6709u9069u7528u7684u898fu5247uff0cu5247u751fu6210 CSS
      unless applicable_rules.empty?
        css_content = applicable_rules.map { |rule| rule['css'] }.join("\n")
        Rails.logger.info "PageStyler: Applying #{applicable_rules.size} CSS rules: #{applicable_rules.map { |r| r['name'] }.join(', ')}"
        
        # u78bau4fdd CSS u5167u5bb9u4e0du70bau7a7a
        unless css_content.blank?
          css_tag = "<style type=\"text/css\">\n#{css_content}\n</style>"
          Rails.logger.info "PageStyler: Injecting CSS: #{css_tag}"
          return css_tag
        else
          Rails.logger.info "PageStyler: CSS content is blank, not injecting any styles"
        end
      else
        Rails.logger.info "PageStyler: No enabled CSS rules found"
      end
      
      ''
    end
  end
end
