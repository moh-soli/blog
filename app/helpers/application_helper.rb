require 'redcarpet'

module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, lexer: language)
      pygments.highlight(code, lexer: language)
    end
  end

    def markdown(content)
        renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true, prettify: true)
        options = {
          autolink: true,
          no_intra_emphasis: true,
          fenced_code_blocks: true,
          lax_html_blocks: true,
          strikethrough: true,
          superscript: true
        }
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe

    end
end
