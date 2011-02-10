class SyntaxhighlighterPreProcessor
  attr_reader :options

  def initialize(opts={})
    @enclose_with_tag = opts.delete(:enclose_with_tag)
    @options = merge_with_defaults(opts)
  end

  def process(body, metadata={})
    body.gsub(%r{<(ruby|js|javascript|shell|bash|html|xml|as3|plain)>(.*?)</\1>}m) do |match|
      escaped_code = ERB::Util.h($2)

      options[:brush] = case $1
        when 'ruby', 'plain', 'as3', 'shell', 'bash', 'xml'
          $1
        when 'js', 'javascript'
          'js; html-script: true'
        when 'html'
          'xml' # html is understood, but there are .xml rules in the CSS
        else
          'plain'
      end

      %{#{enclose_start_tag}<pre class="#{to_class_attribute}">#{escaped_code}</pre>#{enclose_end_tag}}
    end
  end

  private
    def enclose_start_tag
      "<#{@enclose_with_tag}>" if @enclose_with_tag
    end

    def enclose_end_tag
      "</#{@enclose_with_tag}>" if @enclose_with_tag
    end

    def to_class_attribute
      sorted_options.map { |key, value| "#{key}: #{value}" }.join('; ')
    end

    def sorted_options
      options.sort { |first_pair, second_pair| first_pair[0].to_s <=> second_pair[0].to_s }
    end

    def merge_with_defaults(opts)
      { :gutter => false, :toolbar => false }.merge(opts)
    end
end
