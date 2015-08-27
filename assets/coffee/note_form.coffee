# note_form.coffee
#
# Description:
#   View file for form to make notes
#
# Author:
#   @sota1235

App.NoteFormView = Backbone.View.extend
  render: () ->
    template = _.template $('#noteForm-template').html()
    html     = template @model.toJSON()
    @$el.html html
    return this

  events:
    'submit form': 'onSubmit'

  onSubmit: (e) ->
    e.preventDefault()
    attrs =
     title: @$('.js-noteTitle').val()
     body : @$('.js-noteBody').val()
    @trigger 'submit:form', attrs
