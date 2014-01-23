$.rails.hideDropdowns = -> 
  count = $("ul.dropdown-menu.open").length
  $("ul.dropdown-menu").fadeOut(150).removeClass("open")
  !count

$ ->
  $(document).mouseup (e) ->
    container = $("dropdown-menu")
    if (container.has(e.target).length == 0)
      $.rails.hideDropdowns()

  $(window).resize -> $.rails.hideDropdowns()

  $("[data-toggle=dropdown]").click ->    
    if $(this).siblings("ul.dropdown-menu").hasClass("open")
      $.rails.hideDropdowns()
    else
      $.rails.hideDropdowns()
      dropdown = $(this).siblings("ul.dropdown-menu")
      dropdown.fadeIn(150).addClass("open")
      offset = ($(this).outerWidth(false) - $(dropdown).outerWidth(false)) / 2
      dropdown.css { 'margin-left' : offset + "px"}
    false