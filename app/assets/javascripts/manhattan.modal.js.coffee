$ ->
  $(document).on "click", "a[data-toggle=modal]", ->
    target = $($(this).attr("data-target"))
    $.rails.toggleModal(target)

$.rails.toggleModal = (target) ->
  target.toggleClass("active")
  if target.hasClass("active")
    overlay = $("<div class=\"overlay\"></div>")
    target.appendTo(overlay)
    $("body").append(overlay)
  else
    target.parent().remove()
    $("body").append(target)

$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.hideDropdowns()
  $.rails.showConfirmDialog(link)
  false # Always stops the action since code runs asynchronously

$.rails.confirmed = (link, should_continue) ->
  
  $('.overlay').fadeOut 300, ->
    $(this).remove()

  if should_continue
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  header = "Notice"
  html =  """
          <div class="overlay">
            <div class="modal-wrapper">
              <div class="modal">
                <h2>#{ header }</h2>
                <div class="content">
                  <p>#{ message }</p>
                </div>
                <div class="toolbar">
                  <a href="#" class="button" data-action="cancel">Cancel</a>
                  <a href="#" class="button" data-action="continue">Continue</a>
                </div>
              </div>
            </div>
          </div>
          """
  $("body").append(html)
  # $('.overlay a').on 'click', (event) -> 
  #   event.preventDefault()
  #   should_continue = $(this).attr("data-action") == "continue"
  #   $.rails.confirmed(link, should_continue)

(($) ->
  $.fn.modal = ->
    $.rails.toggleModal(this)
) jQuery