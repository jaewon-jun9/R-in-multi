post <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
             encode = 'form', body=list(name='R',age='27'))
name <- html_nodes(read_html(post),'h1')
postcrawling <-html_text(name) 
postcrawling
