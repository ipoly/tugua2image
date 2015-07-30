casper = require('casper').create({
  verbose: true
  pageSettings:
    javascriptEnabled: false
    loadPlugins:false
    userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4'
})

postID = casper.cli.args[0]

if postID
  casper.start()
  casper.thenOpen "http://dapenti.com/blog/readforwx.asp?name=xilei&id=#{postID}", ->
    @echo 'Capture png...'
    @capture 'tugua.png'
  .thenOpen 'canvas.html',->
    @echo 'Capture jpg...'
    @capture 'tugua.jpg'
    @echo 'Done.'
  .run()
else
  console.log 'Post ID is required.'
  casper.exit(0)
