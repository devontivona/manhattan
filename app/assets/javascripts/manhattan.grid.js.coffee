# Hide and show the alignment grid when the "g" key is pressed
KEY_CODE_H = 72
KEY_CODE_V = 86
$ ->
  horizontalGrid = $("<div>", { class: "horizontal-grid" })
  vertialGrid = $("<div>", { class: "vertical-grid" })
  $(document).keydown (e) ->
    console.log (e.keyCode || e.which)
    if (e.keyCode || e.which) == KEY_CODE_H
      horizontalGrid.appendTo("body")
    if (e.keyCode || e.which) == KEY_CODE_V
      vertialGrid.appendTo(".container")
  $(document).keyup (e) -> 
    if (e.keyCode || e.which) == KEY_CODE_H
      $(".horizontal-grid").remove()
    if (e.keyCode || e.which) == KEY_CODE_V
      $(".vertical-grid").remove()