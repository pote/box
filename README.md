# Box - Because you don't always need a filesystem.

Howdy, fellow ruby programmer! I want to make a quick disclosure about this gem: while I don't really like to use this term there is no better way to describe it than "a ridiculous hack", I really like the way sinatra handles inline templates and I've always thought we should be able to have that functionality extracted so we could use it anywhere, this gem is my stab at that particular problem.

Some of the code here is taken directly from sinatra, I've tried to make it as simple and brief as possible but due to its hackish nature you might run into unexpected problems with it, I've found it to work on my use cases (including gems, where previous versions of Box did not work as it used to read from the DATA constant) and I really want to make this piece of software robust and usable by anybody, so please open issues on any problems you encounter using it.

Right then! Let's dive in!


## What is it?

Box is an extremely simple "inline filesystem" for your ruby scripts, inspired by sinatra and their way of handling simple file templates on its own source file. Allow me to demonstrate:

```ruby
require 'box'

Box::FILES.class
#=> Hash

Box::FILES.keys
#=> header.md
#   author.html
#   planet.yml

Box::FILES['author.html']
#=> "
#<div class="author">
#  <img src="{{ image_url }}" style="width: 96px; height: 96;">
#  <span style="position: absolute; padding: 32px 15px;">
#    <i>Original post by <a href="{{ twitter_url }}">{{ author }}</a> - check out <a href="{{ blog_url }}">{{ blog_name }}</a></i>
#  </span>
#</div>
#"

__END__
@@ header.md
---
title: "{{ post_title }}"
kind: article
created_at: {{ post_date }}
author: {{ author }}
layout: post
---

@@ author.html
<div class="author">
  <img src="{{ image_url }}" style="width: 96px; height: 96;">
  <span style="position: absolute; padding: 32px 15px;">
    <i>Original post by <a href="{{ twitter_url }}">{{ author }}</a> - check out <a href="{{ blog_url }}">{{ blog_name }}</a></i>
  </span>
</div>

@@ planet.yml
## planet.rb default config file, modify it and spawn awesomeness!

planet:
    posts_directory: source/_posts/
    templates_directory: source/_layouts/

blogs:
  # Bare minimum to get it working
  - author: "Cubox"
    feed:   "http://blog.cuboxlabs.com/atom.xml"
    image:  "http://cuboxlabs.com/img/cubox-humans/could-be-you.png"

  - author: "Pablo Astigarraga"
    feed:   "http://blog.poteland.com/atom.xml"
    image:  "http://poteland.com/images/avatars/red_mage.png"
    # Other fields:
    twitter: "poteland"
    url: "http://blog.poteland.com"    # => only required for people that don\'t have a \'url\' field on their RSS/Atom field'

```
