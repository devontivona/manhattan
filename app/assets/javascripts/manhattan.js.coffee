configureCheckbox = (checkbox) ->
  if checkbox.is(':checked')
    checkbox.parent().addClass("selected")
  else
    checkbox.parent().removeClass("selected")      

$ ->
	# Make rows of tables selectable
  $("tr[data-target]").click(->
    Turbolinks.visit $(this).attr("data-target")
  ).find("a").hover (->
    $(this).parents("tr").unbind "click"
  ), ->
    $(this).parents("tr").click ->
      Turbolinks.visit $(this).attr("data-target")

  # Add selection states to radio buttons
  $("input[type=radio]").each ->
    if $(this).is(':checked')
      $(this).parent().addClass("selected")
  $("input[type=radio]").change ->
    selected = $(this)
    $('input[type=radio][name="' + selected.attr('name') + '"]').each ->
      if $(this).attr('id') != selected.attr('id')
        $(this).parent().removeClass("selected")
   	selected.parent().addClass("selected")

  # Add selection states to check boxes
  $('input[type=checkbox]').each ->
    configureCheckbox $(this)  
  $('input[type=checkbox]').change ->
    configureCheckbox $(this)