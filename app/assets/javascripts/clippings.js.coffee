# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#set up postMessage listener (enable cross-origin communiation ie postMessage from bookmarklet site to local)
receiveMessage = (event) ->
  alert(event.data)
  console.log("hello0")
  document.getElementById("clipping_content_ifr").contentDocument.getElementById("tinymce").innerHTML += event.data + '<br>'

window.addEventListener("message", receiveMessage, false)
 



