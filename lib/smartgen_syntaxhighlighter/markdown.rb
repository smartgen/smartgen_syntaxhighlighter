require File.expand_path(File.join('syntaxhighlighter_pre_processor'), File.dirname(__FILE__))

Smartgen::Engine::Markdown.register(SyntaxhighlighterPreProcessor.new)