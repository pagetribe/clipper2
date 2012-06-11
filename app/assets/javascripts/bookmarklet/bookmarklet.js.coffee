HOST_NAME = "localhost:3000"

# add jquery to page if it is not already present
addJQuery = ->
  if typeof jQuery == 'undefined'
    jQ = document.createElement('script')
    jQ.type = 'text/javascript'
    jQ.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'
    document.body.appendChild(jQ)

# wait for jquery to be loaded
allowTextSelectionWhenPossible = ->
  if window.jQuery
    console.log('jquery loaded')
    selectedSniffer()
  else
    console.log('jquery still not loaded')
    window.setTimeout(allowTextSelectionWhenPossible, 100)

# get selected / highlighted text /* attempt to find a text selection */ 
getSelected = ->
  if window.getSelection
    return window.getSelection()
  else if document.getSelection
    return document.getSelection()
  else
    selection = document.selection && document.selection.createRange()
    if selection.text
      return selection.text
    false
  false

/* create sniffer */
selectedSniffer = ->
  jQuery(@).mouseup (event) ->
    console.log('mouseup')
    url = 'http://addurlhere.com'
    selection = getSelected()
    if selection && (selection = new String(selection).replace(/^\s|\s+$/g,''))
      console.log(selection)
      if !selectionImage?
        selectionImage = $('<a>').attr({href: url, title: 'Click to add.', target: '_blank', id: 'selection-image'}).hide()
        $(document.body).append(selectionImage)
        console.log(selectionImage)
        #working on this see jsfiddle for code



addPostMessage = ->
  scr = document.createElement('script')
  scr.innerHTML = "window.onload = function(){\
      var win = document.getElementById('clippywrapper').contentWindow;\
      //change this to javascript funct that detects user selected text this was for testing from a form.
      //this works win.postMessage( '...text to go into text box here...', '*' );\
      document.getElementById('new_clipping').onsubmit = function(e){\
        win.postMessage( document.getElementById('msg').value, '*' );\
        e.preventDefault();\
        };\
      };"


clippySetIframe = ->
  iframe = document.getElementById("clippywrapper").contentWindow
  if(!iframe)
    return
  url = 'http://' + HOST_NAME + '/clippings/new'
  try
    iframe.location.replace(url)
  catch e
    iframe.location = url

addFrameToPage = ->
  addJQuery()
  console.log "in addDiv"
  container = document.createElement("div")
  container.style.padding = "0"
  container.style.margin = "0"
  container.style.border = "1px solid #000000"
  container.id = "clippingbox"
  container.style.position = "fixed"
  container.style.top = "0"
  container.style.right = "0"
  container.style.width = "350px"
  container.style.height = "300px"
  container.style.backgroundColor = "#FFFFFF"
  container.innerHTML = '<iframe style="width:100%;height:300px;border:0px" id="clippywrapper"></iframe>'
  document.body.appendChild(container)
  clippySetIframe()
  allowTextSelectionWhenPossible()

addFrameToPage()

#jQuery ($) ->
  #selectedSniffer()