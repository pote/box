require 'box'

class TestClass
  include Box

  assertion = Box::FILES.keys.size == 3

  puts 'Basic test passing: ' + assertion.to_s.capitalize
end

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
