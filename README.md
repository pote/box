# Box - Because you don't always need a filesystem.

Howdy, fellow ruby programmer! I am going to start this README file by apologizing deeply for what you are about to witness, it's been a long day, I've worked for far too many hours, and I thought it would be fun to write it.

Let me know if I should punch myself repeatedly in the face for this.


## What is it?

Box is an extremely simple 'inline filesystem' for your ruby scripts, inspired by sinatra and their way of handling simple file templates on its own source file. Allowme to demonstrate:

```ruby
require 'box'

include Box

Box::FILES.class
#=> Hash

Box::FILES.keys
#=> header.md
#   author.html
#   planet.yml

Box::FILES['author.html'].to_s
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
