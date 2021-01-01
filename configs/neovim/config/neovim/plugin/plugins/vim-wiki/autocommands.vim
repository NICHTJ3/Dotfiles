" Diary entry template
autocmd! BufNewFile */diary/[0-9]*.md :silent 0r !echo "\
      \# `date +'\%d-\%m-\%Y'`\
      \n\#\#: <Task>\
      \n\#\#\# What I am doing\
      \n\#\#\# What I need to do\
      \n[TODO](../index)\
      \n\#\#\# What did I do"
