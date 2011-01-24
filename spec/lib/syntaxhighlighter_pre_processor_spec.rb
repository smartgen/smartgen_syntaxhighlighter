# -*- encoding: utf-8 -*-
$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'rspec'
require 'smartgen_syntaxhighlighter/syntaxhighlighter_pre_processor'

describe SyntaxhighlighterPreProcessor do
  ['ruby', 'plain', 'as3', 'shell', 'bash', 'xml'].each do |language|
    def body(language)
      "<#{language}>some code here</#{language}>"
    end

    it "should replace '<#{language}>' tags with proper <pre> tags and brush" do
      subject.process(body(language)).should == "<pre class=\"brush: #{language}; gutter: false; toolbar: false\">some code here</pre>"
    end
  end
  
  ['js', 'javascript'].each do |language|
    def body(language)
      "<#{language}>some code here</#{language}>"
    end

    it "should replace '<#{language}>' tags with proper <pre> tags and 'js' brush, adding 'html-script: true' option" do
      subject.process(body(language)).should == "<pre class=\"brush: js; html-script: true; gutter: false; toolbar: false\">some code here</pre>"
    end
  end
  
  it "should use 'xml' when rendering 'html' tags" do
    subject.process("<html>some code here</html>").should == "<pre class=\"brush: xml; gutter: false; toolbar: false\">some code here</pre>"
  end
  
  context "with options" do
    subject { SyntaxhighlighterPreProcessor.new :toolbar => true, :gutter => true }
    
    it "should use given options" do
      subject.process("<ruby>some code here</ruby>").should == "<pre class=\"brush: ruby; gutter: true; toolbar: true\">some code here</pre>"
    end
    
    context "with enclose_with_tag option" do
      subject { SyntaxhighlighterPreProcessor.new :enclose_with_tag => 'my_tag' }
      
      it "should enclose language tag with given tag" do
        subject.process("<ruby>some code here</ruby>").should == "<my_tag><pre class=\"brush: ruby; gutter: false; toolbar: false\">some code here</pre></my_tag>"
      end
    end
  end
end