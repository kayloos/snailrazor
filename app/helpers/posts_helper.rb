module PostsHelper
  def markdown(text)
    return unless text.class == String

    options = {
               :hard_wrap          => true,
               :filter_html        => true,
               :autolink           => true,
               :no_intraemphasis   => true,
               :fenced_code_blocks => true,
               :gh_blockcode       => true
    }

    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    syntax_highlighter(renderer.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//code[@class]").each do |code|
      code.parent.replace Pygments.highlight(code.text.rstrip, :lexer => code[:class])
    end
    doc.to_s.prepend("<style>#{Pygments.css(:style => 'friendly')}</style>")
  end
end
