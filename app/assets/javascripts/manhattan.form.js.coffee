$ ->

  $("input[type=file]").each ->
    cancel = $("<div>", { class: "input-wrapper", text: "Remove File" })
    file = $(this)
    cancel.click (event) ->
      file.val("")
      file.parent().toggleClass("hidden")
      cancel.remove()
    file.parent().prepend("Upload File")
    file.change (event) ->      
      if file.val() != ""
        file.parent().toggleClass("hidden")
        cancel.insertAfter(file.parent())
        