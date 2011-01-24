Smartgen Syntaxhighlighter
==========================

Adds support to use Alex Gorbatchev's Syntax Highlighter [plugin](http://alexgorbatchev.com/SyntaxHighlighter/) with smartgen.

## How it works?

Basically it creates a pre processor that substitute any of the following tags with proper _pre_ tags:

- ruby
- js
- javascript
- shell
- bash
- html
- xml
- as3
- plain

## Using

To use it with default settings, add gem to your gemspec:

    gem 'smartgen_syntaxhighlighter'

And then require all engines pre processors after smartgen:

    require 'smartgen'
    require 'smartgen_syntaxhighlighter/all'

If you want to use it just for textile files:

    require 'smartgen'
    require 'smartgen_syntaxhighlighter/textile'

or for markdown files:

    require 'smartgen'
    require 'smartgen_syntaxhighlighter/markdown'

## Customizing

If you need to customize options, the you'll need to register the pre processor yourself:

    require 'smartgen'
    require 'smartgen_syntaxhighlighter/pre_processor'

    Smartgen::Engine::Textile.register(SyntaxhighlighterPreProcessor.new(:gutter => true, :toolbar => true))
