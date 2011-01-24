require File.expand_path(File.join('pre_processor'), File.dirname(__FILE__))

Smartgen::Engine::Markdown.register(SyntaxhighlighterPreProcessor.new)